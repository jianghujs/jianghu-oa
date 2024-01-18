const content = {
  pageType: 'jh-page',
  pageId: 'journalManagement',
  table: 'task',
  pageName: '日志管理',
  idGenerate: {
    prefix: 'RZ',
    bizId: 'taskId',
    startValue: 10001,
  },
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
  ], // 额外resource { actionId, resourceType, resourceData }
  drawerList: [], // 抽屉列表 { key, title, contentList }
  includeList: [], // 其他资源引入
  common: {
    data: {
      constantObj: {
        member: [],
        taskStatus: [
          {
            text: '未开始',
            value: '未开始',
            color: 'blue',
          },
          {
            text: '进行中',
            value: '进行中',
            color: 'orange',
          },
          {
            text: '已完成',
            value: '已完成',
            color: 'grey',
          },
        ],
        taskLevel: [
          {
            text: '无',
            value: '无',
            color: 'grey',
          },
          {
            text: '低',
            value: '低',
            color: 'green',
          },
          {
            text: '中',
            value: '中',
            color: 'orange',
          },
          {
            text: '高',
            value: '高',
            color: 'red',
          },
        ],
      },
      validationRules: {
        requireRules: [(v) => !!v || '必填'],
      },
    },
    watch: {},
    computed: {},
    doUiAction: {}, // 额外uiAction { [key]: [action1, action2]}
    methods: {},
  },
  headContent: {
    helpDrawer: {}, // 自动初始化md文件
    serverSearchList: [
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskManagerId',
        attrs: { prefix: '负责人', items: 'constantObj.member' },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhere.taskMemberIdList',
        attrs: { prefix: '参与人', items: 'constantObj.member' },
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
      { text: "日志ID", value: "taskId", width: 120 },
      { text: "日志名称", value: "taskTitle", width: 120 },
      { text: "日志内容", value: "taskContent", width: 120 },

      { text: "操作者", value: "operationByUser", width: 120 },
      { text: "操作时间", value: "operationAt", width: 250 },
      { text: '操作', value: 'action', align: 'center', sortable: false, width: 120, class: 'fixed', cellClass: 'fixed' },
    ],
  },
  createDrawerContent: {
    formItemList: [
      {
        label: '日志名称',
        model: 'taskTitle',
        tag: 'v-text-field',
        required: true,
        rules: 'validationRules.requireRules',
      },
      { label: '发给谁', model: 'taskMemberIdList', tag: 'v-autocomplete', attrs: {':items': 'constantObj.taskLevel'} },
      { label: '日志内容', cols: 12, model: 'taskContent', tag: 'v-textarea' },
      {
        label: '任务关联的附件列表',
        model: 'taskFileList',
        tag: 'v-text-field',
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
          { label: '发给谁', model: 'taskMemberIdList', tag: 'v-autocomplete', attrs: {':items': 'constantObj.taskLevel'} },
          { label: '日志内容', cols: 12, model: 'taskContent', tag: 'v-textarea' },
          {
            label: '任务关联的附件列表',
            model: 'taskFileList',
            tag: 'v-text-field',
          },
        ],
      },
      { label: '操作记录', type: 'component', componentPath: 'recordHistory' },
    ],
  },

  deleteContent: {},
};

module.exports = content;
