const content = {
  pageType: 'jh-page',
  pageId: 'ticketManagement',
  table: 'task',
  pageName: '审批管理',
  resourceList: [
    {
      actionId: 'selectItemList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询列表-ticketManagement',
      resourceData: {
        table: 'task',
        operation: 'select',
      },
    },
    {
      actionId: 'insertItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅添加-ticketManagement',
      resourceData: {
        table: 'task',
        operation: 'jhInsert',
      },
    },
    {
      actionId: 'updateItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅更新-ticketManagement',
      resourceData: {
        table: 'task',
        operation: 'jhUpdate',
      },
    },
    {
      actionId: 'deleteItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅删除-ticketManagement',
      resourceData: {
        table: 'task',
        operation: 'jhDelete',
      },
    },
    {
      actionId: 'getTaskTemplate',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅task模板查询',
      resourceData: {
        table: 'task_template',
        operation: 'select',
      },
    },
    {
      actionId: 'getUserList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询用户列表',
      resourceData: {
        table: '_view01_user',
        operation: 'select',
      },
    },
    {
      actionId: 'selectRecordHistory',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询操作记录',
      resourceData: { table: '_record_history', operation: 'select' },
    },
  ], // 额外resource { actionId, resourceType, resourceData }
  drawerList: [

  ], // 抽屉列表 { key, title, contentList }
  includeList: [
    { type: 'include', path: 'common/constant.html' },
    { type: 'include', path: 'component/task-attachment-list.html' },
    { type: 'include', path: 'component/view-ticket-detail-drawer.html', includeType: 'auto' },
  ], // 其他资源引入
  common: {
    data: {
      isMobile: 'window.innerWidth < 500',
      constantObj: 'window.constantObj',
      taskTemplateList: [],
      memberList: [],
      createItem: {},
      userId: 'window.userInfo.userId',
      validationRules: {
        requireRules: [(v) => !!v || '必填'],
      },

      currentSceneId: "'scene1'",
      sceneList: [
        {
          form: {
            taskManagerId: '<$ ctx.userInfo.userId $>',
            taskType: '审批',
          },
          name: '我的申请',
          id: 'scene1',
        },
        {
          form: {
            taskAuditUserIdList: `%<$ ctx.userInfo.userId $>%`,
            taskType: '审批',
          },
          name: '我的待办',
          id: 'scene2',
        },
      ],
    },
    created() {
      this.doUiAction('getTableData');
      this.doUiAction('getTaskTemplate');
      this.doUiAction('getUserList');
    },
    watch: {},
    computed: {},
    doUiAction: {
      useScene: ['useScene', 'getTableData'],
      getUserList: ['getUserList'],
      getTaskTemplate: ['getTaskTemplate'],
      handleTaskTemplateChange: ['handleTaskTemplateChange'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      useScene(funObj) {
        this.currentSceneId = funObj.id;
        this.serverSearchWhereLike = _.cloneDeep(funObj.form);
      },

      async getUserList() {
        const rows = (
          await window.jianghuAxios({
            data: {
              appData: {
                pageId: 'ticketManagement',
                actionId: 'getUserList',
                actionData: {},
                orderBy: [{ column: 'operationAt', order: 'desc' }],
              },
            },
          })
        ).data.appData.resultData.rows;
        this.memberList = rows;
      },
      async handleTaskTemplateChange({ taskTemplateId, item }) {
        const taskTemplate = this.taskTemplateList.find(
          (item) => item.taskTemplateId === taskTemplateId
        );
        item.taskAuditConfig = JSON.parse(taskTemplate.taskTemplatePersonList);
      },

      async getTaskTemplate() {
        const rows = (
          await window.jianghuAxios({
            data: {
              appData: {
                pageId: 'ticketManagement',
                actionId: 'getTaskTemplate',
                actionData: {},
                orderBy: [{ column: 'operationAt', order: 'desc' }],
              },
            },
          })
        ).data.appData.resultData.rows;
        this.taskTemplateList = rows;
      },
    },
  },
  headContent: {
    helpDrawer: {}, // 自动初始化md文件
    serverSearchList: [
      {
        tag: 'div',
        model: '',
        value: `
          <v-btn-toggle :value="0" @change="doUiAction('useScene', sceneList[$event])" color="success" small>
            <v-btn v-for="scene in sceneList" small>{{scene.name}}</v-btn>
          </v-btn-toggle>
        `,
        attrs: {
          class: 'text-right',
        },
      },
    ],
    serverSearchWhere: { taskType: '审批' },
    serverSearchWhereLike: {
      taskManagerId: '<$ ctx.userInfo.userId $>',
      taskType: '审批',
    },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      { text: '任务名称', value: 'taskTitle', width: 200 },
      { text: '优先级', value: 'taskLevel', width: 120 },
      { text: '任务状态', value: 'taskStatus', width: 120 },
      { text: '开始时间', value: 'taskStartAt', width: 120 },
      { text: '结束时间', value: 'taskEndAt', width: 120 },
      { text: '负责人', value: 'taskManagerId', width: 120 },
      { text: '操作者', value: 'operationByUser', width: 120 },
      { text: '操作时间', value: 'operationAt', width: 250 },
      { text: '操作', value: 'action', width: 120 },
    ],
    rowActionList: [
      {
        tag: 'span',
        value: `<v-icon size="16" class="success--text">mdi-note-edit-outline</v-icon>审批`,
        attrs: {
          'v-if': `item.taskAuditUserIdList.includes(userId) && currentSceneId != 'scene1'`,
          role: 'button',
          class: 'success--text font-weight-medium font-size-2 mr-2',
          '@click': "doUiAction('viewMemberList', item)",
        },
      },
    ],
  },
  createDrawerContent: {
    formItemList: [
      {
        label: '审批Id',
        model: 'taskId',
        idGenerate: {
          prefix: 'SP',
          bizId: 'taskId',
          startValue: 10001,
        },
        colsAttrs: {
          class: 'd-none',
        },
      },
      {
        model: 'taskCreateAt',
        default: "dayjs().format('YYYY-MM-DD hh:mm:ss')",
        colsAttrs: {
          class: 'd-none',
        },
      },

      {
        label: '审批名称',
        model: 'taskTitle',
        tag: 'v-text-field',
        required: true,
        rules: 'validationRules.requireRules',
      },
      { label: '审批描述', model: 'taskDesc', tag: 'v-text-field' },
      { label: '审批内容', model: 'taskContent', cols: 12, tag: 'v-textarea' },
      {
        label: '审批模板',
        model: 'taskTemplateId',
        tag: 'v-select',
        required: true,
        rules: 'validationRules.requireRules',
        attrs: {
          ':items': 'taskTemplateList',
          'item-text': 'taskTemplateName',
          'item-value': 'taskTemplateId',
          '@change':
            "doUiAction('handleTaskTemplateChange', { taskTemplateId: $event, item: createItem})",
        },
      },
      {
        label: '',
        default: '[]',
        cols: 12,
        tag: 'v-col',
        model: 'taskAuditConfig',
        valueType: 'json',
        value: `
        <v-row v-for="item in createItem.taskAuditConfig">
          <v-col cols="2">
            <v-text-field hide-actions hide-controls hide-details class="jh-v-input " dense filled single-line v-model="item.position"
              disabled></v-text-field>
          </v-col>
          <v-col cols="4">
            <v-autocomplete hide-actions hide-controls hide-details :items="memberList" item-text="username" item-value="userId" class="jh-v-input mr-2" dense
              filled single-line :rules="validationRules.requireRules" v-model="item.userId" disabled>
            </v-autocomplete>
          </v-row>
        `,
        attrs: {
          'v-if': 'createItem.taskAuditConfig.length',
        },
        default: '[]',
        valueType: 'json',
      },
      {
        label: '附件列表',
        default: '[]',
        cols: 12,
        model: 'taskFileList',
        valueType: 'json',
        tag: 'task-attachment-list',
        default: '[]',
        valueType: 'json',
      },
    ],
  },

  updateDrawerContent: {
    contentList: [
      {
        label: '详细信息',
        type: 'form',
        formItemList: [
          {
            model: 'taskCreateAt',
            default: "dayjs().format('YYYY-MM-DD hh:mm:ss')",
            colsAttrs: {
              class: 'd-none',
            },
          },
          {
            model: 'taskManagerId',
            default: 'window.userInfo.userId',
            colsAttrs: {
              class: 'd-none',
            },
          },
          {
            label: '审批名称',
            model: 'taskTitle',
            tag: 'v-text-field',
            required: true,
            rules: 'validationRules.requireRules',
          },
          { label: '审批描述', model: 'taskDesc', tag: 'v-text-field' },
          {
            label: '审批内容',
            model: 'taskContent',
            cols: 12,
            tag: 'v-textarea',
          },
          {
            label: '审批模板',
            model: 'taskTemplateId',
            tag: 'v-select',
            required: true,
            rules: 'validationRules.requireRules',
            attrs: {
              ':items': 'taskTemplateList',
              'item-text': 'taskTemplateName',
              'item-value': 'taskTemplateId',
              '@change':
                "doUiAction('handleTaskTemplateChange', { taskTemplateId: $event, item: updateItem})",
            },
          },
          {
            label: '',
            cols: 12,
            tag: 'v-col',
            model: 'taskAuditConfig',
            value: `
            <v-row v-for="item in updateItem.taskAuditConfig">
              <v-col cols="2">
                <v-text-field hide-actions hide-controls hide-details class="jh-v-input " dense filled single-line v-model="item.position"
                  disabled></v-text-field>
              </v-col>
              <v-col cols="4">
                <v-autocomplete hide-actions hide-controls hide-details :items="memberList" item-text="username" item-value="userId" class="jh-v-input mr-2" dense
                  filled single-line :rules="validationRules.requireRules" v-model="item.userId" disabled>
                </v-autocomplete>
              </v-row>
            `,
            attrs: {
              'v-if': 'updateItem.taskAuditConfig.length',
            },
            default: '[]',
            valueType: 'json',
          },
          {
            label: '附件列表',
            cols: 12,
            model: 'taskFileList',
            tag: 'task-attachment-list',
            default: '[]',
            valueType: 'json',
          },
        ],
      },
      { label: '操作记录', type: 'component', componentPath: 'recordHistory' },
    ],
  },

  deleteContent: {},
};

module.exports = content;
