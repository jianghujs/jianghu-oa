const content = {
  pageType: 'jh-page',
  pageId: 'journalManagement',
  table: 'task',
  pageName: '日志管理',

  resourceList: [
    {
      actionId: 'selectItemList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询列表-journalManagement',
      resourceData: {
        table: 'task',
        operation: 'select',
      },
    },
    {
      actionId: 'insertItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅添加-journalManagement',
      resourceData: {
        table: 'task',
        operation: 'jhInsert',
      },
    },
    {
      actionId: 'updateItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅更新-journalManagement',
      resourceData: {
        table: 'task',
        operation: 'jhUpdate',
      },
    },
    {
      actionId: 'deleteItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅删除-journalManagement',
      resourceData: {
        table: 'task',
        operation: 'jhDelete',
      },
    },
    {
      actionId: 'selectRecordHistory',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询操作记录',
      resourceData: { "table": "_record_history", "operation": "select" },
    },
  ], // 额外resource { actionId, resourceType, resourceData }
  drawerList: [], // 抽屉列表 { key, title, contentList }
  includeList: [
    { type: 'include', path: 'common/constant.html' },
    { type: 'include', path: 'component/task-attachment-list.html' },
  ], // 其他资源引入
  common: {
    data: {
      isMobile: 'window.innerWidth < 500',
      memberList: [],
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
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
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
        this.constantObj.memberList = rows;
      },
    },
  },
  headContent: {
    helpDrawer: {}, // 自动初始化md文件
    serverSearchList: [
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskManagerId',
        attrs: { prefix: '负责人', items: 'constantObj.memberList' },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhere.taskMemberIdList',
        attrs: { prefix: '参与人', items: 'constantObj.memberList' },
      },
    ],
    serverSearchWhere: { taskType: '日志' },
    serverSearchWhereLike: {
      taskManagerId: '<$ ctx.userInfo.userId $>',
      taskMemberIdList: null,
    },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      { text: '日志ID', value: 'taskId', width: 120 },
      { text: '日志名称', value: 'taskTitle', width: 120 },
      { text: '日志内容', value: 'taskContent', width: 120 },

      { text: '操作者', value: 'operationByUser', width: 120 },
      { text: '操作时间', value: 'operationAt', width: 250 },
      {
        text: '操作',
        value: 'action',
        align: 'center',
        sortable: false,
        width: 120,
        class: 'fixed',
        cellClass: 'fixed',
      },
    ],
  },
  createDrawerContent: {
    formItemList: [
      {
        label: '日志Id',
        model: 'taskId',
        idGenerate: {
          prefix: 'RZ',
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
        model: 'taskManagerId',
        default: 'window.userInfo.userId',
        colsAttrs: {
          class: 'd-none',
        },
      },
      {
        label: '日志名称',
        model: 'taskTitle',
        tag: 'v-text-field',
        required: true,
        rules: 'validationRules.requireRules',
      },
      {
        label: '发给谁',
        model: 'taskMemberIdList',
        tag: 'v-autocomplete',
        attrs: {
          ':items': 'constantObj.taskTemplate',
          'item-text': 'taskTemplateName',
          'item-value': 'taskTemplateId',
        },
      },
      { label: '日志内容', cols: 12, model: 'taskContent', tag: 'v-textarea' },
      {
        label: '附件列表',
        cols: 12,
        model: 'taskFileList',
        tag: 'task-attachment-list',
        default: '[]',
        valueType: 'json'
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
            label: '日志名称',
            model: 'taskTitle',
            tag: 'v-text-field',
            required: true,
            rules: 'validationRules.requireRules',
          },
          {
            label: '发给谁',
            model: 'taskMemberIdList',
            tag: 'v-autocomplete',
            attrs: {
              ':items': 'constantObj.taskTemplate',
              'item-text': 'taskTemplateName',
              'item-value': 'taskTemplateId',
            },
          },
          {
            label: '日志内容',
            cols: 12,
            model: 'taskContent',
            tag: 'v-textarea',
          },
          {
            label: '附件列表',
            cols: 12,
            model: 'taskFileList',
            tag: 'task-attachment-list',
            default: '[]',
            valueType: 'json'
          },
        ],
      },
      { label: '操作记录', type: 'component', componentPath: 'recordHistory' },
    ],
  },

  deleteContent: {},
};

module.exports = content;
