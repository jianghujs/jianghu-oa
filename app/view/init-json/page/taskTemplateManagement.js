const content = {
  pageType: 'jh-page',
  pageId: 'taskTemplateManagement',
  table: 'task_template',
  pageName: '模板配置',
  
  resourceList: [
    {
      actionId: 'selectItemList',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅查询列表-taskTemplateManagement',
      resourceData: {
        table: 'task_template',
        operation: 'select',
      },
    },
    {
      actionId: 'insertItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅添加-taskTemplateManagement',
      resourceData: {
        table: 'task_template',
        operation: 'jhInsert',
      },
    },
    {
      actionId: 'updateItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅更新-taskTemplateManagement',
      resourceData: {
        table: 'task_template',
        operation: 'jhUpdate',
      },
    },
    {
      actionId: 'deleteItem',
      resourceType: 'sql',
      resourceHook: {},
      desc: '✅删除-taskTemplateManagement',
      resourceData: {
        table: 'task_template',
        operation: 'jhDelete',
      },
    },
  ], // 额外resource { actionId, resourceType, resourceData }
  drawerList: [], // 抽屉列表 { key, title, contentList }
  includeList: [
    { type: 'include', path: 'component/task-approval-person-list.html' },

  ], // 其他资源引入
  common: {
    data: {
      isMobile: 'window.innerWidth < 500',
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
    // serverSearchList: [
    //   { tag: "v-text-field", model: "serverSearchWhereLike.name", attrs: { prefix: "学生名字", }},
    //   { tag: "v-select", model: "serverSearchWhere.gender", attrs: { prefix: "性别", items: ["全部", "男", "女"] } },
    //   { tag: "v-date-picker", model: "serverSearchWhereLike.dateOfBirth",  attrs: { prefix: "出生日期", type: "month" },             },
    // ],
    // serverSearchWhere: { gender: "全部" },
    // serverSearchWhereLike: { name: null, dateOfBirth: null },
  },
  pageContent: {
    tag: 'jh-table',
    attrs: {},
    value: [
      {
        text: '任务模板ID',
        value: 'taskTemplateId',
        type: 'v-text-field',
        width: 80,
        sortable: true,
        
      },
      {
        text: '任务模板名称',
        value: 'taskTemplateName',
        type: 'v-text-field',
        width: 80,
        sortable: true,
      },
      {
        text: '创建时间',
        value: 'taskTemplateCreateAt',
        type: 'v-text-field',
        width: 80,
        sortable: true,
      },
      {
        text: '操作者用户名',
        value: 'operationByUser',
        type: 'v-text-field',
        width: 80,
        sortable: true,
      },
      {
        text: '操作时间',
        value: 'operationAt',
        type: 'v-text-field',
        width: 80,
        sortable: true,
      },
      { text: '操作', value: 'action', width: 80, sortable: true },
    ],
  },
  createDrawerContent: {
    
    formItemList: [
      {
        label: '任务模板Id',
        model: 'taskTemplateId',
        tag: 'v-text-field',
        rules: 'validationRules.requireRules',
        idGenerate: {
          prefix: 'MB',
          bizId: 'taskTemplateId',
          startValue: 10001,
        },
        colsAttrs: {
          class: 'd-none'
        }
      },
      {
        label: '任务模板名称',
        model: 'taskTemplateName',
        tag: 'v-text-field',
        rules: 'validationRules.requireRules',
      },
      {
        label: '任务模板icon',
        model: 'taskTemplateIcon',
        tag: 'v-text-field',
        rules: 'validationRules.requireRules',
      },
      {
        label: '审批人列表',
        cols: 12,
        model: 'taskTemplatePersonList',
        tag: 'task-approval-person-list',
        rules: 'validationRules.requireRules',
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
            label: '任务模板名称',
            model: 'taskTemplateName',
            tag: 'v-text-field',
            rules: 'validationRules.requireRules',
          },
          {
            label: '任务模板icon',
            model: 'taskTemplateIcon',
            tag: 'v-text-field',
            rules: 'validationRules.requireRules',
          },
          {
            label: '审批人列表',
            cols: 12,
            model: 'taskTemplatePersonList',
            tag: 'task-approval-person-list',
            rules: 'validationRules.requireRules',
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
