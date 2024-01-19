const content = {
  pageType: 'jh-page',
  pageId: 'taskManagement',
  table: 'task',
  pageName: '任务管理',
  resourceList: [
    {
      actionId: 'selectItemList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询列表-taskManagement',
      resourceData: {
        table: 'task',
        operation: 'select',
      },
    },
    {
      actionId: 'insertItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅添加-taskManagement',
      resourceData: {
        table: 'task',
        operation: 'jhInsert',
      },
    },
    {
      actionId: 'updateItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅更新-taskManagement',
      resourceData: {
        table: 'task',
        operation: 'jhUpdate',
      },
    },
    {
      actionId: 'deleteItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅删除-taskManagement',
      resourceData: {
        table: 'task',
        operation: 'jhDelete',
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
  includeList: [
    { type: 'include', path: 'component/task-attachment-list.html' },
    { type: 'include', path: 'component/task-child-list.html' },
    { type: 'include', path: 'component/task-comment-list.html' },
  ], // 其他资源引入
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
    created() {
      this.doUiAction('getTableData');
      this.doUiAction('getUserList');
    },
    watch: {},
    computed: {},
    doUiAction: {
      getUserList: ['getUserList'],
      updateTaskItem: ['updateTaskItem'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      async updateTaskItem({id, data}) {
        await window.jhMask.show();

        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'taskManagement',
              actionId: 'updateItem',
              actionData: data,
              where: {id}
            }
          }
        })
        await window.jhMask.hide();
      },

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
        this.constantObj.member = rows;
      },
    },
  },
  headContent: {
    helpDrawer: {}, // 自动初始化md文件

    serverSearchList: [
      {
        tag: 'v-select',
        model: 'serverSearchWhereLike.taskManagerId',
        attrs: {
          prefix: '负责人',
          ':items': 'constantObj.member',
          'item-text': 'username',
          'item-value': 'userId',
        },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhere.taskMemberIdList',
        attrs: {
          prefix: '参与人',
          ':items': 'constantObj.member',
          'item-text': 'username',
          'item-value': 'userId',
        },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhere.taskLevel',
        attrs: { prefix: '优先级', items: 'constantObj.taskLevel' },
      },
      {
        tag: 'v-select',
        model: 'serverSearchWhere.taskStatus',
        attrs: { prefix: '状态', items: 'constantObj.taskStatus' },
      },
      {
        tag: 'v-date-picker',
        model: 'serverSearchWhere.taskEndAt',
        attrs: { prefix: '截止时间' },
      },
    ],
    serverSearchWhere: { taskType: '任务' },
    serverSearchWhereLike: {
      taskManagerId: '<$ ctx.userInfo.userId $>',
      taskMemberIdList: null,
    },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      { text: '任务名称', value: 'taskTitle', width: 200 },
      { text: '优先级', value: 'taskLevel',  width: 120, formatter: [
        { 
          tag: "v-autocomplete", 
          value: '{{item.taskLevel}}', 
          attrs: {
            ':items': 'constantObj.taskLevel',
            'v-model': 'item.taskLevel',
            dense: true,
            filled: true,
            'single-line': true,
            class: 'jh-v-input',
            '@change': "doUiAction('updateTaskItem', {id: item.id, data: {taskLevel: item.taskLevel}})",
          },}
      ] },
      { text: '任务状态', value: 'taskStatus', width: 120, formatter: [
        { 
          tag: "v-autocomplete", 
          value: '{{item.taskStatus}}', 
          attrs: {
            ':items': 'constantObj.taskStatus',
            'v-model': 'item.taskStatus',
            dense: true,
            filled: true,
            'single-line': true,
            class: 'jh-v-input',
            '@change': "doUiAction('updateTaskItem', {id: item.id, data: {taskStatus: item.taskStatus}})",
          },}
      ] },
      { text: '开始时间', value: 'taskStartAt', width: 120, formatter: [
        { 
          tag: "v-text-field", 
          attrs: {
            'v-model': 'item.taskStartAt',
            dense: true,
            filled: true,
            'single-line': true,
            class: 'jh-v-input',
            '@blur': "doUiAction('updateTaskItem', {id: item.id, data: {taskStartAt: item.taskStartAt}})",
          },}
      ] },
      { text: '结束时间', value: 'taskEndAt', width: 120, formatter: [
        { 
          tag: "v-text-field", 
          attrs: {
            'v-model': 'item.taskEndAt',
            dense: true,
            filled: true,
            'single-line': true,
            class: 'jh-v-input',
            '@blur': "doUiAction('updateTaskItem', {id: item.id, data: {taskEndAt: item.taskEndAt}})",
          },}
      ] },
      { text: '负责人', value: 'taskManagerId', width: 120, formatter: [
        { 
          tag: "v-autocomplete", 
          value: '{{item.taskManagerId}}', 
          attrs: {
            ':items': 'constantObj.member',
            'v-model': 'item.taskManagerId',
            'item-text': 'username',
            'item-value': 'userId',
            dense: true,
            filled: true,
            'single-line': true,
            class: 'jh-v-input',
            '@change': "doUiAction('updateTaskItem', {id: item.id, data: {taskManagerId: item.taskManagerId}})",
          },}
      ] },
      { text: '操作者', value: 'operationByUser', width: 120 },
      { text: '操作时间', value: 'operationAt', width: 250 },
      { text: '操作', value: 'action', width: 120 },
    ],
  },
  createDrawerContent: {
    formItemList: [
      {
        label: '任务Id',
        model: 'taskId',
        idGenerate: {
          prefix: 'RW',
          bizId: 'taskId',
          startValue: 10001,
        },
        colsAttrs: {
          class: 'd-none',
        },
      },
      {
        label: '任务名称',
        model: 'taskTitle',
        tag: 'v-text-field',
        required: true,
        rules: 'validationRules.requireRules',
      },
      { label: '任务描述', model: 'taskDesc', tag: 'v-text-field' },
      {
        label: '任务优先级',
        model: 'taskLevel',
        tag: 'v-autocomplete',
        attrs: { ':items': 'constantObj.taskLevel' },
      },
      {
        label: '任务标签',
        model: 'taskTag',
        tag: 'v-combobox',
        attrs: { multiple: true },
      },
      { label: '任务开始时间', model: 'taskStartAt', tag: 'v-date-picker' },
      { label: '任务结束时间', model: 'taskEndAt', tag: 'v-date-picker' },
      {
        label: '负责人id',
        model: 'taskManagerId',
        tag: 'v-autocomplete',
        attrs: {
          ':items': 'constantObj.member',
          'item-text': 'username',
          'item-value': 'userId',
        },
      },
      {
        label: '参与人id',
        model: 'taskMemberIdList',
        tag: 'v-autocomplete',
        attrs: {
          ':items': 'constantObj.member',
          'item-text': 'username',
          'item-value': 'userId',
          multiple: true,
        },
      },
      {
        label: '子任务',
        cols: 12,
        model: 'taskChildList',
        tag: 'task-child-list',
        default: '[]',
        valueType: 'json'
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

  updateDrawerContent: {
    contentList: [
      {
        label: '详细信息',
        type: 'form',
        formItemList: [
          {
            label: '任务名称',
            model: 'taskTitle',
            tag: 'v-text-field',
            required: true,
            rules: 'validationRules.requireRules',
          },
          { label: '任务描述', model: 'taskDesc', tag: 'v-text-field' },
          {
            label: '任务优先级',
            model: 'taskLevel',
            tag: 'v-autocomplete',
            attrs: { ':items': 'constantObj.taskLevel' },
          },
          {
            label: '任务标签',
            model: 'taskTag',
            tag: 'v-combobox',
            attrs: { multiple: true },
          },
          { label: '任务开始时间', model: 'taskStartAt', tag: 'v-date-picker' },
          { label: '任务结束时间', model: 'taskEndAt', tag: 'v-date-picker' },
          {
            label: '负责人id',
            model: 'taskManagerId',
            tag: 'v-autocomplete',
            attrs: {
              ':items': 'constantObj.member',
              'item-text': 'username',
              'item-value': 'userId',
            },
          },
          {
            label: '参与人id',
            model: 'taskMemberIdList',
            tag: 'v-autocomplete',
            attrs: {
              ':items': 'constantObj.member',
              'item-text': 'username',
              'item-value': 'userId',
              multiple: true,
            },
          },
          {
            label: '子任务',
            cols: 12,
            model: 'taskChildList',
            tag: 'task-child-list',
            default: '[]',
            valueType: 'json'
          },
          {
            label: '附件列表',
            cols: 12,
            model: 'taskFileList',
            tag: 'task-attachment-list',
            default: '[]',
            valueType: 'json'
          },
          {
            label: '评论列表',
            cols: 12,
            model: 'taskCommentList',
            tag: 'task-comment-list',
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
