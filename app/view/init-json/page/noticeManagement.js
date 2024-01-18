const content = {
  pageType: 'jh-page',
  pageId: 'noticeManagement',
  table: 'task',
  pageName: '通知管理',
  idGenerate: {
    prefix: 'TZ',
    bizId: 'taskId',
    startValue: 10001,
  },
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
      resourceHook: {},
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
        attrs: { prefix: '通知类型', items: 'constantObj.member' },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskManagerId',
        attrs: { prefix: '读取状态', items: 'constantObj.member' },
      },
    ],
    serverSearchWhere: { taskType: '通知' },
    serverSearchWhereLike: {
      taskManagerId: '<$ ctx.userInfo.userId $>',
      taskMemberIdList: null,
    },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      { text: "通知名称", value: "taskTitle", width: 120 },
      { text: "通知描述", value: "taskDesc", width: 200 },
      { text: "创建时间", value: "taskCreateAt", width: 250 },
      { text: "操作", value: "action", width: 150 },
    ],
  },

  deleteContent: {},
};

module.exports = content;
