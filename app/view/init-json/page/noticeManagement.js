const content = {
  pageType: 'jh-page',
  pageId: 'noticeManagement',
  table: 'task',
  pageName: '通知管理',

  resourceList: [
    {
      actionId: 'selectItemList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询列表-noticeManagement',
      resourceData: {
        table: 'task',
        operation: 'select',
      },
    },
    {
      actionId: 'insertItem',
      resourceType: 'sql',
      resourceHook: {
        before: [
          { service: 'common', serviceFunction: 'generateBizIdOfBeforeHook' },
        ],
      },
      desc: '✅添加-noticeManagement',
      resourceData: {
        table: 'task',
        operation: 'jhInsert',
      },
    },
    {
      actionId: 'updateItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅更新-noticeManagement',
      resourceData: {
        table: 'task',
        operation: 'jhUpdate',
      },
    },
    {
      actionId: 'deleteItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅删除-noticeManagement',
      resourceData: {
        table: 'task',
        operation: 'jhDelete',
      },
    },
    {
      actionId: 'updateAllNotReadNotice',
      resourceType: 'service',
      resourceHook: {},
      desc: '✅更新已读通知',
      resourceData: {
        service: 'notice',
        serviceFunction: 'updateAllNotReadNotice',
      },
    },
    {
      actionId: 'deleteAllReadNotice',
      resourceType: 'service',
      resourceHook: {},
      desc: '✅删除所有已读通知',
      resourceData: {
        service: 'notice',
        serviceFunction: 'deleteAllReadNotice',
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
  ], // 额外resource { actionId, resourceType, resourceData }
  drawerList: [], // 抽屉列表 { key, title, contentList }
  includeList: [{ type: 'include', path: 'common/constant.html' }], // 其他资源引入
  common: {
    memberList: [],
    data: {
      isMobile: 'window.innerWidth < 500',
      constantObj: 'window.constantObj',
      validationRules: {
        requireRules: [(v) => !!v || '必填'],
      },
    },
    created() {
      this.doUiAction('getTableData');
      this.doUiAction('getUserList');
    },
    watch: {},
    computed: {},
    doUiAction: {
      getUserList: ['getUserList'],
      updateAllTaskReadStatus: ['updateAllTaskReadStatus', 'getTableData'],
      deleteAllTask: ['confirmDeleteDialog', 'deleteAllTask', 'getTableData'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      async getUserList() {
        const rows = (
          await window.jianghuAxios({
            data: {
              appData: {
                pageId: 'taskManagement',
                actionId: 'getUserList',
                actionData: {},
                orderBy: [{ column: 'operationAt', order: 'desc' }],
              },
            },
          })
        ).data.appData.resultData.rows;
        this.memberList = rows;
      },

      async updateAllTaskReadStatus() {
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'noticeManagement',
              actionId: 'updateAllNotReadNotice',
              actionData: {},
            },
          },
        });
      },
      async deleteAllTask() {
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'noticeManagement',
              actionId: 'deleteAllReadNotice',
            },
          },
        });
        await window.vtoast.success('删除全部已读通知成功');
      },
      async confirmDeleteDialog() {
        if (
          (await window.confirmDialog({
            title: '删除',
            content: '确定删除吗？',
          })) === false
        ) {
          throw new Error('[confirmCreateFormDialog] 否');
        }
      },
    },
  },
  headContent: {
    helpDrawer: {}, // 自动初始化md文件
    serverSearchList: [
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskType',
        attrs: { prefix: '通知类型', ':items': 'constantObj.taskType' },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskReadStatus',
        attrs: { prefix: '读取状态', ':items': 'constantObj.taskReadStatus' },
      },
    ],
    serverSearchWhere: { taskType: '通知' },
    serverSearchWhereLike: {
      taskManagerId: '<$ ctx.userInfo.userId $>',
      taskMemberIdList: null,
      taskReadStatus: '否',
      taskType: null,
    },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      { text: '通知名称', value: 'taskTitle', width: 120 },
      { text: '通知描述', value: 'taskDesc', width: 200 },
      { text: '创建时间', value: 'taskCreateAt', width: 250 },
      { text: '操作', value: 'action', width: 150 },
    ],
    headActionList: [
      {
        tag: 'v-menu',
        value: `
          <template v-slot:activator="{ on, attrs }">
              <v-btn color="primary"
                small
                outlined
                v-bind="attrs"
                v-on="on"
              >
                更多
                <v-icon size="14">
                  mdi-chevron-down
                </v-icon>
              </v-btn>
          </template>
          <v-card style="max-height: 300px;">
            <v-list>
              <v-list-item @click="doUiAction('updateAllTaskReadStatus')">全部标记为已读</v-list-item>
              <v-list-item @click="doUiAction('deleteAllTask')">删除全部已读信息</v-list-item>
            </v-list>
          </v-card>
        `,
        attrs: {
          ':nudge-width': '100',
          ':offset-y': true,
        },
      },
    ],
  },
  createDrawerContent: {
    formItemList: [
      {
        label: '通知Id',
        model: 'taskId',
        idGenerate: {
          prefix: 'TZ',
          bizId: 'taskId',
          startValue: 10001,
        },
        colsAttrs: {
          class: 'd-none',
        },
      },
      {
        model: 'taskType',
        default: "'通知'",
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
        model: 'taskManagerId',
        default: 'window.userInfo.userId',
        colsAttrs: {
          class: 'd-none',
        },
      },
      {
        label: '公告名称',
        model: 'taskTitle',
        tag: 'v-text-field',
        rules: 'validationRules.requireRules',
        required: true,
        attrs: {},
      },
      {
        label: '通知范围',
        model: 'taskMemberIdList',
        tag: 'v-select',
        rules: 'validationRules.requireRules',
        required: true,
        attrs: {
          ':items': 'memberList',
          'item-text': 'username',
          'item-value': 'userId',
        },
      },
      {
        label: '公告内容',
        model: 'taskContent',
        tag: 'v-textarea',
        cols: 12,
        rules: 'validationRules.requireRules',
        required: true,
        attrs: {},
      },
    ],
  },
  deleteContent: {},
};

module.exports = content;
