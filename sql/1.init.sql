# EMPTY TABLE

TRUNCATE TABLE _cache;
TRUNCATE TABLE _constant;
TRUNCATE TABLE _constant_ui;
TRUNCATE TABLE _page;
TRUNCATE TABLE _record_history;
TRUNCATE TABLE _resource;
TRUNCATE TABLE _test_case;
TRUNCATE TABLE _ui;
TRUNCATE TABLE _user_session;
TRUNCATE TABLE task;
TRUNCATE TABLE task_template;
TRUNCATE TABLE _directory_user_session;
TRUNCATE TABLE _group;
TRUNCATE TABLE _role;
TRUNCATE TABLE _user_group_role;
TRUNCATE TABLE _user_group_role_page;
TRUNCATE TABLE _user_group_role_resource;
TRUNCATE TABLE _view01_task;
TRUNCATE TABLE _view01_user;
TRUNCATE TABLE _view01_user_group;
TRUNCATE TABLE _view02_user_app;
# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户Id',
  `content` longtext COMMENT '缓存数据',
  `recordStatus` varchar(255) DEFAULT 'active',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '缓存表';


# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `constantType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `constantValue` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '常量表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

INSERT INTO `_constant` (`id`,`constantKey`,`constantType`,`desc`,`constantValue`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'noticeType','array','通知类型','[\r\n    {\r\n        \"text\": \"公告\",\r\n        \"value\": \"公告\"\r\n    },\r\n    {\r\n        \"text\": \"任务\",\r\n        \"value\": \"任务\"\r\n    },\r\n    {\r\n        \"text\": \"审批\",\r\n        \"value\": \"审批\"\r\n    },\r\n    {\r\n        \"text\": \"日志\",\r\n        \"value\": \"日志\"\r\n    }\r\n]','update',NULL,NULL,'2023-03-07T15:17:37+08:00');
INSERT INTO `_constant` (`id`,`constantKey`,`constantType`,`desc`,`constantValue`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'taskLevel','array','任务优先级','[\r\n    {\r\n        \"text\": \"无\",\r\n        \"value\": \"无\",\r\n        \"color\": \"grey\"\r\n    },\r\n    {\r\n        \"text\": \"低\",\r\n        \"value\": \"低\",\r\n        \"color\": \"green\"\r\n    },\r\n    {\r\n        \"text\": \"中\",\r\n        \"value\": \"中\",\r\n        \"color\": \"orange\"\r\n    },\r\n    {\r\n        \"text\": \"高\",\r\n        \"value\": \"高\",\r\n        \"color\": \"red\"\r\n    }\r\n]','update',NULL,NULL,'2023-03-07T15:17:37+08:00');
INSERT INTO `_constant` (`id`,`constantKey`,`constantType`,`desc`,`constantValue`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'taskStatus','array','任务状态','[\r\n    {\r\n        \"text\": \"未开始\",\r\n        \"value\": \"未开始\",\r\n        \"color\": \"blue\"\r\n    },\r\n    {\r\n        \"text\": \"进行中\",\r\n        \"value\": \"进行中\",\r\n        \"color\": \"orange\"\r\n    },\r\n    {\r\n        \"text\": \"已完成\",\r\n        \"value\": \"已完成\",\r\n        \"color\": \"grey\"\r\n    }\r\n]','update',NULL,NULL,'2023-03-07T15:17:37+08:00');
INSERT INTO `_constant` (`id`,`constantKey`,`constantType`,`desc`,`constantValue`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (4,'taskTemplateGroup','array','任务模板分组','[\r\n    {\r\n        \"text\": \"行政\",\r\n        \"value\": \"行政\"\r\n    },\r\n    {\r\n        \"text\": \"人事\",\r\n        \"value\": \"人事\"\r\n    },\r\n    {\r\n        \"text\": \"其他\",\r\n        \"value\": \"其他\"\r\n    }\r\n]','update',NULL,NULL,'2023-03-07T15:17:37+08:00');

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant_ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant_ui`;
CREATE TABLE `_constant_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `constantType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常量类型; object, array',
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT 'all' COMMENT '页面id',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `en` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `zh` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pageId_constantKey_unique` (`constantKey`, `pageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '常量表;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _constant_ui
# ------------------------------------------------------------

INSERT INTO `_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'btn','object','all','按钮','{\"upload\":\"upload\", \"createFolder\":\"folder\",\"material\":\"material\",\"materialManagement\":\"material management\",\"logout\":\"logout\",\"logoutSuccess\":\"logout succeeded\",\"fileName\":\"file name\",\"rename\":\"rename\",\"cancel\":\"cancel\",\"paste\":\"paste\",\"create\":\"create\",\"fileName\":\"file name\",\"use\":\"use\",\"selectFile\":\"Please select a folder or file\",\"file\":\"file\",\"fileNotFound\":\"File or folder not found\",\"folderEmpty\":\"folder is empty\",\"enterFileName\":\"Please enter a file name\",\"fileRename\":\"file rename\",\"renamedSuccess\":\"File renamed successfully\",\"uploadProgress\":\"upload progress\",\"movedSuccess\":\"File moved successfully\",\"uploadTo\":\"upload to\",\"maxFileSize\":\"Max file size\",\"maxFilesCount\":\"Max files count\",\"delete\":\"delete\",\"sureDelete\":\"Are you sure you want to delete this \",\"yes\":\"yes\",\"folder\":\"folder\",\"uploadAll\":\"upload all\",\"removeAll\":\"remove all\"}','{\"upload\":\"上传\", \"createFolder\":\"创建文件夹\",\"material\":\"素材\",\"materialManagement\":\"素材管理\",\"logout\":\"退出登录\",\"logoutSuccess\":\"退出登录成功\",\"rename\":\"重命名\",\"cancel\":\"取消\",\"paste\":\"粘贴\",\"create\":\"创建\",\"fileName\":\"文件名\",\"use\":\"使用\",\"import\":\"导入\",\"selectFile\":\"请选择一个文件夹或文件\",\"file\":\"文件\",\"fileNotFound\":\"找不到文件或文件夹\",\"folderEmpty\":\"文件夹为空\",\"enterFileName\":\"请输入文件名\",\"fileRename\":\"文件重命名\",\"renamedSuccess\":\"文件重命名成功\",\"uploadProgress\":\"上传进度\",\"movedSuccess\":\"文件移动成功\",\"uploadTo\":\"上传至\",\"maxFileSize\":\"最大文件大小\",\"maxFilesCount\":\"最大文件数\",\"delete\":\"删除\",\"sureDelete\":\"确定你想要删除这个\",\"yes\":\"是的\",\"folder\":\"文件夹\",\"uploadAll\":\"全部上传\",\"removeAll\":\"全部移除\",\"copyPath\":\"复制文件路径\",\"toMaterialRepo\":\"从素材中心导入\"}','insert',NULL,NULL,NULL);
INSERT INTO `_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'common','object','all','公共','{\n\"add\":\"add\",\n\"view\":\"view\",\n\"modify\":\"modify\",\n\"delete\":\"delete\",\n\"recycle\":\"recycle\",\n\"recover\":\"recover\",\n\"cancel\":\"cancel\",\n\"sure\":\"sure\",\n\"manage\":\"manage\",\n\"save\":\"save\",\n\"saveAndPreview\":\"saveAndPreview\",\n\"moveToRecycleBin\":\"move to recycle bin\",\n\"operate\":\"operate\",\n\"select\":\"select\"\n}','{\n\"add\":\"新增\",\n\"view\":\"查看\",\n\"modify\":\"修改\",\n\"delete\":\"删除\",\n\"recycle\":\"回收站\",\n\"recover\":\"恢复\",\n\"cancel\":\"取消\",\n\"sure\":\"确定\",\n\"manage\":\"管理\",\n\"save\":\"保存\",\n\"saveAndPreview\":\"保存并预览\",\n\"moveToRecycleBin\":\"移到回收站\",\n\"operate\":\"操作\",\n\"select\":\"选择\"\n}','insert',NULL,NULL,NULL);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'pageId',
  `pageName` varchar(255) DEFAULT NULL COMMENT 'page name',
  `pageHook` varchar(255) DEFAULT NULL,
  `pageFile` varchar(255) DEFAULT NULL COMMENT 'page文件指定; 默认使用pageId.html',
  `pageType` varchar(255) DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `pageIcon` text,
  `sort` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '页面表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _page
# ------------------------------------------------------------

INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','帮助',NULL,'helpV4',NULL,NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'login','登陆',NULL,'loginV4',NULL,NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'manual','操作手册',NULL,NULL,NULL,NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,'taskManagement','任务','{\r\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"},\r\n\t\t{\"service\": \"constant\", \"serviceFunc\": \"getConstantObj\", \"field\": \"constantObj\"}\r\n\t]\r\n}',NULL,'showInMenu',NULL,'1','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,'ticketManagement','[审批]我收到的',NULL,NULL,'showInMenu',NULL,'12','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (11,'journalManagement','[日志]我收到的',NULL,NULL,'showInMenu',NULL,'33','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,'noticeManagement','通知',NULL,NULL,'showInMenu',NULL,'40','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,'taskTemplateManagement','[审批]审批模板','{\"beforeHook\": [{\"service\": \"constant\", \"serviceFunc\": \"getConstantObj\", \"field\": \"constantObj\"}]}',NULL,'showInMenu',NULL,'50','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (14,'workbench','工作台',NULL,NULL,'showInMenu',NULL,'0','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (15,'calendarManagement','日历',NULL,NULL,'showInMenu',NULL,'0','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (16,'ticketIndex','[审批]审批首页',NULL,NULL,'',NULL,'10','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (17,'ticketReport','[审批]审批报表',NULL,NULL,'',NULL,'13','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,'ticketStartApply','[审批]发起申请','{\r\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"}\r\n\t]\r\n}',NULL,'showInMenu',NULL,'10','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (21,'ticketSubmitManagement','[审批]我提交的','{\r\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"}\r\n\t]\r\n}',NULL,'showInMenu',NULL,'13','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'afficheManagement','公告','{\r\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"}\r\n\t]\r\n}',NULL,'showInMenu',NULL,'30','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (24,'afficheViewer','公告预览',NULL,NULL,'',NULL,'30','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (50,'journalTemplateManagement','[日志]日志模板','{\"beforeHook\": [{\"service\": \"constant\", \"serviceFunc\": \"getConstantObj\", \"field\": \"constantObj\"}]}',NULL,'showInMenu',NULL,'34','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (51,'journalStartAdd','[日志]新建日志','',NULL,'showInMenu',NULL,'30','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (52,'journalSubmitManagement','[日志]我发出的',NULL,NULL,'showInMenu',NULL,'32','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageName`,`pageHook`,`pageFile`,`pageType`,`pageIcon`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (54,'https://demo.jianghujs.org/task/page/noticeManagement','通知/待办',NULL,NULL,'showInRightMenu','<svg width=\"28\" height=\"28\" viewBox=\"0 0 28 28\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"> <g id=\"Frame 19\"> <path id=\"Vector\" d=\"M14 0C6.2695 0 0 6.2695 0 14C0 21.7305 6.2695 28 14 28C21.7305 28 28 21.7305 28 14C28 6.2695 21.7305 0 14 0Z\" fill=\"#5DB55F\"/> <g id=\"Frame\"> <path id=\"Vector_2\" d=\"M15.2698 19.44L15.307 19.4419C15.5022 19.4633 15.6398 19.6499 15.5895 19.8403L15.57 19.9088C15.3646 20.5638 14.7393 21.04 14.0001 21.04L13.9239 21.0384C13.193 21.0057 12.5866 20.5075 12.4103 19.8403L12.4033 19.8048C12.3758 19.6153 12.5284 19.44 12.7303 19.44H15.2698ZM14.0001 6.95996C14.1274 6.95996 14.2495 7.01053 14.3395 7.10055C14.4295 7.19057 14.4801 7.31266 14.4801 7.43996V7.94364C16.9402 8.191 18.8001 10.3545 18.8001 12.8556V16.24L18.802 16.288C18.8141 16.4489 18.8866 16.5994 19.0049 16.7091C19.1232 16.8189 19.2787 16.8799 19.4401 16.88H19.5543L19.6087 16.8816C20.0055 16.9065 20.3562 17.1993 20.3959 17.5974L20.3994 17.6486C20.4037 17.7562 20.3861 17.8635 20.3479 17.9642C20.3096 18.0648 20.2514 18.1567 20.1768 18.2343C20.1022 18.312 20.0127 18.3737 19.9137 18.4159C19.8146 18.4581 19.7081 18.4799 19.6004 18.48H8.44583L8.39143 18.4784C7.99463 18.4534 7.64391 18.1606 7.60423 17.7625L7.60071 17.7113C7.59649 17.6037 7.61404 17.4964 7.65231 17.3957C7.69058 17.295 7.74878 17.2031 7.82342 17.1255C7.89807 17.0479 7.98762 16.9861 8.0867 16.9439C8.18579 16.9017 8.29238 16.88 8.40007 16.88H8.56007L8.60807 16.8784C8.76908 16.8663 8.91956 16.7937 9.02935 16.6753C9.13914 16.5569 9.20012 16.4014 9.20007 16.24V12.72C9.20007 10.231 11.0945 8.1846 13.5201 7.94364V7.43996C13.5201 7.31266 13.5706 7.19057 13.6607 7.10055C13.7507 7.01053 13.8728 6.95996 14.0001 6.95996Z\" fill=\"white\"/> </g> </g> </svg>',NULL,'insert',NULL,NULL,NULL);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _record_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` json NOT NULL COMMENT '数据JSON',
  `packageContent` json NOT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`, `operation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 607 DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '数据历史表';


# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COMMENT 'appData 参数校验',
  `resourceData` text COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COMMENT '请求Demo',
  `responseDemo` text COMMENT '响应Demo',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 386 DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (20,NULL,'','afficheViewer','selectItemList','✅查询列表','sql','{}','{ \"table\": \"task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (40,NULL,NULL,'allPage','uploadFileDone','✅ 文件分片上传-所有分片上传完毕','service','{}','{ \"service\": \"file\", \"serviceFunction\": \"uploadFileDone\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (41,NULL,NULL,'allPage','getTaskList','✅ 任务列表','sql','{}','{ \"table\": \"task\", \"operation\": \"select\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,NULL,NULL,'allPage','updateTask','✅ 更新任务','sql','{}','{ \"table\": \"task\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,NULL,NULL,'allPage','deleteTask','✅ 删除任务','sql','{}','{ \"table\": \"task\", \"operation\": \"jhDelete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,NULL,NULL,'allPage','addApprovalNotice','✅ 添加审批通知','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"addApprovalNotice\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,NULL,NULL,'allPage','updateConstant','✅ 更新常量','sql','{}','{ \"table\": \"_constant\", \"operation\": \"jhUpdate\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (46,NULL,NULL,'allPage','addCommentNotice','✅ 添加评论通知','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"addCommentNotice\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (47,NULL,NULL,'allPage','useMaterial','✅文章编辑-使用素材','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"useMaterial\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (48,NULL,NULL,'allPage','list','✅xf编辑-文件列表','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"list\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (49,NULL,NULL,'allPage','mkdir','✅xf编辑-创建文件夹','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"mkdir\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (50,NULL,NULL,'allPage','moveFile','✅xf编辑-移动文件','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"moveFile\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (51,NULL,NULL,'allPage','copyFile','✅xf编辑-复制文件','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"copyFile\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (52,NULL,NULL,'allPage','renameFile','✅xf编辑-文件重命名','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"renameFile\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (53,NULL,NULL,'allPage','delete','✅xf编辑-删除','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"delete\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (54,NULL,NULL,'allPage','clearRecycle','✅xf编辑-清空回收站','service','{}','{ \"service\": \"material\", \"serviceFunction\": \"clearRecycle\" }','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (55,NULL,NULL,'allPage','logout','✅登出','service',NULL,'{ \"service\": \"user\", \"serviceFunction\": \"logout\" }','','','update',NULL,NULL,'2022-02-23T23:08:31+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (56,NULL,NULL,'allPage','userInfo','✅获取用户信息','service',NULL,'{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }','','','update',NULL,NULL,'2022-11-04T11:49:34+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (57,NULL,NULL,'allPage','getUserList','✅获取用户信息','sql',NULL,'{ \"table\": \"_view01_user_group\", \"operation\": \"select\" }','','','update',NULL,NULL,'2022-11-04T11:49:34+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (58,NULL,NULL,'allPage','httpUploadByStream','✅ 文件分片上传-http文件流','service','{}','{ \"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\" }','','','update',NULL,NULL,'2022-03-10T22:27:32+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (59,NULL,NULL,'allPage','addNotice','✅添加通知','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"addNotice\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (70,NULL,NULL,'login','passwordLogin','✅登陆','service',NULL,'{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }','{\"appData\":{\"pageId\":\"login\",\"actionId\":\"passwordLogin\",\"actionData\":{\"userId\":\"admin\",\"password\":\"123456\",\"deviceId\":\"127.0.0.1:7007_Mac.10.15.7_fbae8120_chrome\"},\"appId\":\"directory\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36\"},\"packageId\":\"1677218075598_2695287\",\"packageType\":\"httpRequest\"}','{\"packageId\":\"1677218075598_2695287\",\"packageType\":\"httpResponse\",\"status\":\"success\",\"timestamp\":\"2023-02-24T13:54:35+08:00\",\"appData\":{\"authToken\":\"AUxhx6Z48Vgas6teOIqijUo-I5qpBikMIHu_\",\"deviceId\":\"127.0.0.1:7007_Mac.10.15.7_fbae8120_chrome\",\"userId\":\"admin\",\"resultData\":{\"authToken\":\"AUxhx6Z48Vgas6teOIqijUo-I5qpBikMIHu_\",\"deviceId\":\"127.0.0.1:7007_Mac.10.15.7_fbae8120_chrome\",\"userId\":\"admin\"},\"appId\":\"directory\",\"pageId\":\"login\",\"actionId\":\"passwordLogin\"}}','update',NULL,NULL,'2023-02-24T13:54:35+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (90,NULL,'{\"before\": [], \"after\": [{\"service\": \"notice\", \"serviceFunction\": \"replaceNoticeUrlAfterHook\"}]}','noticeManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (91,NULL,'{\"before\": [{\"service\": \"common\", \"serviceFunction\": \"generateBizIdOfBeforeHook\"}], \"after\": []}','noticeManagement','insertItem','✅添加','sql','{}','{ \"table\": \"task\", \"operation\": \"insert\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (92,NULL,NULL,'noticeManagement','updateItem','✅更新','sql','{}','{ \"table\": \"task\", \"operation\": \"jhUpdate\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (93,NULL,NULL,'noticeManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"task\", \"operation\": \"jhDelete\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (95,NULL,NULL,'noticeManagement','updateAllNotReadNotice','✅更新未读消息列表','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"updateAllNotReadNotice\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (96,NULL,NULL,'noticeManagement','deleteAllReadNotice','✅删除已读消息列表','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"deleteAllReadNotice\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (110,NULL,NULL,'taskManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (111,NULL,'{\"before\": [{\"service\": \"common\", \"serviceFunction\": \"generateBizIdOfBeforeHook\"}], \"after\": []}','taskManagement','insertItem','✅添加','sql','{}','{ \"table\": \"task\", \"operation\": \"insert\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (112,NULL,NULL,'taskManagement','updateItem','✅更新','sql','{}','{ \"table\": \"task\", \"operation\": \"jhUpdate\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (113,NULL,NULL,'taskManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"task\", \"operation\": \"jhDelete\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (150,NULL,NULL,'taskTemplateManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"task_template\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (151,NULL,'{\"before\": [{\"service\": \"common\", \"serviceFunction\": \"generateBizIdOfBeforeHook\"}], \"after\": []}','taskTemplateManagement','insertItem','✅添加','sql','{}','{ \"table\": \"task_template\", \"operation\": \"insert\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (152,NULL,NULL,'taskTemplateManagement','updateItem','✅更新','sql','{}','{ \"table\": \"task_template\", \"operation\": \"jhUpdate\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (153,NULL,NULL,'taskTemplateManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"task_template\", \"operation\": \"jhDelete\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (154,NULL,NULL,'taskTemplateManagement','testQiWeiNotice','✅测试企微通知','service','{}','{ \"service\": \"notice\", \"serviceFunction\": \"testQiWeiNotice\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (170,NULL,NULL,'ticketManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"_view01_task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (171,NULL,'{\"before\": [{\"service\": \"common\", \"serviceFunction\": \"generateBizIdOfBeforeHook\"}], \"after\": []}','ticketManagement','insertItem','✅添加','sql','{}','{ \"table\": \"task\", \"operation\": \"insert\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (172,NULL,NULL,'ticketManagement','updateItem','✅更新','sql','{}','{ \"table\": \"task\", \"operation\": \"jhUpdate\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (173,NULL,NULL,'ticketManagement','deleteItem','✅删除','sql','{}','{ \"table\": \"task\", \"operation\": \"jhDelete\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (174,NULL,NULL,'ticketManagement','selectTaskTemplateList','✅获取任务模板列表','sql','{}','{ \"table\": \"task_template\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (175,NULL,NULL,'ticketManagement','handleTicketApply','✅处理审批','service','{}','{ \"service\": \"ticket\", \"serviceFunction\": \"handleTicketApply\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (190,NULL,NULL,'ticketStartApply','getTaskTemplateList','✅task模板列表','sql','{}','{ \"table\": \"task_template\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (210,NULL,NULL,'ticketSubmitManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"_view01_task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (211,NULL,NULL,'ticketSubmitManagement','updateItem','✅查询列表','sql','{}','{ \"table\": \"task\", \"operation\": \"jhUpdate\" }',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (339,NULL,'','afficheManagement','selectItemList','✅查询列表','sql','{}','{ \"table\": \"task\", \"operation\": \"select\" }',NULL,NULL,'insert',NULL,NULL,NULL);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COLLATE utf8mb4_bin COMMENT '测试用例步骤;',
  `expectedResult` text COLLATE utf8mb4_bin COMMENT '期望结果',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '测试用例表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------


# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COMMENT 'ui 动作数据',
  `appDataSchema` text COMMENT 'ui 校验数据',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = 'ui 施工方案';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _ui
# ------------------------------------------------------------


# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text COMMENT '请求的 agent',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_index` (`userId`, `deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '用户session表; deviceId 维度;软删除未启用;';


# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(11) DEFAULT NULL COMMENT '自增ID, 1001++',
  `taskId` varchar(255) DEFAULT NULL COMMENT '任务ID',
  `taskTemplateId` varchar(255) DEFAULT NULL COMMENT '任务模板id',
  `taskBizId` varchar(255) DEFAULT NULL COMMENT '任务业务ID;绑定的业务或办公应用rowId',
  `taskTitle` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `taskDesc` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `taskLevel` varchar(255) DEFAULT NULL COMMENT '任务优先级',
  `taskTag` varchar(255) DEFAULT NULL COMMENT '任务标签',
  `taskStatus` varchar(255) DEFAULT '进行中' COMMENT '任务状态：进行中,已完成,已拒绝',
  `taskType` varchar(255) DEFAULT NULL COMMENT '任务类型: 任务,审批,日志',
  `taskContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '任务内容;任务,审批,日志表单内容',
  `taskCreateAt` varchar(255) DEFAULT NULL COMMENT '任务创建时间;',
  `taskReadStatus` varchar(255) DEFAULT '否' COMMENT '消息是否已读;是,否',
  `taskStartAt` varchar(255) DEFAULT NULL COMMENT '任务开始时间',
  `taskEndAt` varchar(255) DEFAULT NULL COMMENT '任务结束时间',
  `taskManagerId` varchar(255) DEFAULT NULL COMMENT '负责人id;只能一个',
  `taskMemberIdList` varchar(255) DEFAULT NULL COMMENT '参与人id;可能多个',
  `taskCommentList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '任务评论列表',
  `taskRelationList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '任务关联的信息列表',
  `taskFileList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '任务关联的附件列表',
  `taskChildList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '子任务列表todo',
  `taskNoticeConfig` text COMMENT '抄送人配置;',
  `taskAuditUserIdList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '审核用户ID列表; 多个用英文逗号分隔',
  `taskAuditedUserIdList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '已审核用户ID列表; 多个用英文逗号分隔',
  `taskAuditConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '审核配置; { "ticketAuditUserIdList": ["xxx", "xxx"], "ticketAuditedUserIdList": ["xxx", "xxx"] }',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 DEFAULT CHARSET = utf8mb4 ROW_FORMAT = DYNAMIC COMMENT = '任务表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: task
# ------------------------------------------------------------

INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (253,1001,'RW1001',NULL,NULL,'【导航网站】项目初始化','项目仓库，架子搭建','高','网站,导航','进行中','任务','项目仓库，架子搭建','2024-03-18 11:27:40','否','2024-03-01','2024-03-31','admin','W10001','[]',NULL,'[]','[]',NULL,NULL,NULL,NULL,'jhUpdate','W10001','张三丰','2024-03-18T11:33:39+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (254,1002,'TZ1002',NULL,'RW1001','导航网站项目初始化','项目仓库，架子搭建',NULL,NULL,'进行中','通知',NULL,'2024-03-18 11:27:40','否',NULL,NULL,'W10001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T11:27:40+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (255,1003,'RW1003',NULL,NULL,'【导航网站】爬虫',NULL,'无','爬虫','进行中','任务','爬取内容，填充数据','2024-03-18 11:30:36','否','2024-03-19','2024-03-21','admin','W10001,W10003,W10004','[]',NULL,'[{\"filename\":\"爬虫文档.pdf\",\"downloadBasePath\":\"/jianghu-oa/upload\",\"downloadPath\":\"/taskMaterial/W10001/爬虫文档.pdf\",\"binarySize\":154533}]','[{\"text\":\"调研导航网站\",\"completed\":false},{\"text\":\"写爬虫脚本\",\"completed\":false}]',NULL,NULL,NULL,NULL,'jhUpdate','W10001','张三丰','2024-03-18T11:33:38+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (256,1004,'TZ1004',NULL,'RW1003','任务邀请提醒','张三丰 邀请您参与<a>《导航网站爬虫》</a>任务，请及时查看',NULL,NULL,'进行中','通知','爬取内容，填充数据','2024-03-18 11:30:38','否',NULL,NULL,'W10001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T11:30:38+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (257,1005,'TZ1005',NULL,'RW1003','任务邀请提醒','张三丰 邀请您参与<a>《导航网站爬虫》</a>任务，请及时查看',NULL,NULL,'进行中','通知','爬取内容，填充数据','2024-03-18 11:30:38','否',NULL,NULL,'W10003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T11:30:38+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (258,1006,'TZ1006',NULL,'RW1003','任务邀请提醒','张三丰 邀请您参与<a>《导航网站爬虫》</a>任务，请及时查看',NULL,NULL,'进行中','通知','爬取内容，填充数据','2024-03-18 11:30:38','否',NULL,NULL,'W10004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T11:30:38+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (259,1007,'RW1007',NULL,NULL,'【导航网站】UI调研',NULL,'高','ui','进行中','任务','调研导航网站ui样式，参考','2024-03-18 11:35:08','否','2024-03-18','2024-03-19','admin','admin',NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,'insert','admin','系统管理员','2024-03-18T11:35:08+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (260,1008,'TZ1008',NULL,'RW1007','任务邀请提醒','系统管理员 邀请您参与<a>《【导航网站】UI调研》</a>任务，请及时查看',NULL,NULL,'进行中','通知','调研导航网站ui样式，参考','2024-03-18 11:35:08','是',NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhUpdate','admin','系统管理员','2024-03-18T12:01:02+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (261,1009,'SP1009','MB1006',NULL,'加班-系统管理员-20240318115802',NULL,NULL,NULL,'进行中','审批','[{\"id\":\"select_72gYXdaW\",\"component\":{\"items\":\"工作日加班,休息日加班,节假日加班\",\"value\":\"工作日加班\",\"label\":\"加班类型\",\"required\":true,\"typeDesc\":\"选择框\",\"type\":\"select\",\"tag\":\"v-autocomplete\",\"icon\":\"mdi-select\"}},{\"id\":\"date_x6l5obDH\",\"component\":{\"items\":\"\",\"value\":\"2024-03-22\",\"label\":\"开始时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"date_JuCaMpCg\",\"component\":{\"items\":\"\",\"value\":\"2024-03-23\",\"label\":\"结束时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"input_CdPstnfS\",\"component\":{\"items\":\"\",\"value\":\"16\",\"label\":\"时长(小时)\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-format-text-rotation-none\"}},{\"id\":\"textarea_-LHFu4mr\",\"component\":{\"items\":\"\",\"value\":\"项目赶工\",\"label\":\"加班原因\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_gGIYCglX\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','2024-03-18 11:58:39','否',NULL,NULL,'admin','admin,W10001',NULL,NULL,NULL,NULL,'[]','admin,W10001','admin','[{\"id\":1,\"username\":\"系统管理员\",\"userId\":\"admin\",\"status\":\"同意\",\"remark\":\"666\",\"operationAt\":\"2024-03-18 11:58:55\"},{\"id\":2,\"username\":\"张三丰\",\"userId\":\"W10001\"}]','update','admin','系统管理员','2024-03-18T11:58:55+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (262,1010,'TZ1010',NULL,'SP1009','待审批提醒','系统管理员 提交了<a>《加班-系统管理员-20240318115802》</a>，请及时处理',NULL,NULL,'进行中','通知',NULL,'2024-03-18 11:58:39','是',NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhUpdate','admin','系统管理员','2024-03-18T12:00:51+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (263,1011,'TZ1011',NULL,'TZ1011','待审批提醒','系统管理员 提交了<a>《加班-系统管理员-20240318115802》</a>，请及时处理',NULL,NULL,'进行中','通知',NULL,'2024-03-18 11:58:55','否',NULL,NULL,'W10001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T11:58:55+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (264,1012,'SP1012','MB1007',NULL,'出差-系统管理员-20240318115906',NULL,NULL,NULL,'进行中','审批','[{\"id\":\"date_H0zlNRIo\",\"component\":{\"items\":\"\",\"value\":\"2024-03-19\",\"label\":\"开始时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"date_XyfSepVI\",\"component\":{\"items\":\"\",\"value\":\"2024-03-20\",\"label\":\"结束时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"input_KXMRh0HH\",\"component\":{\"items\":\"\",\"value\":\"16\",\"label\":\"时长(小时)\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-format-text-rotation-none\"}},{\"id\":\"textarea_bvJM6c_a\",\"component\":{\"items\":\"\",\"value\":\"找客户\",\"label\":\"出差事由\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_cpYHjsQV\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','2024-03-18 11:59:32','否',NULL,NULL,'admin','admin,W10001,W10002',NULL,NULL,NULL,NULL,'[]','admin,W10001,W10002',NULL,'[{\"id\":1,\"username\":\"系统管理员\",\"userId\":\"admin\"},{\"id\":2,\"username\":\"张三丰\",\"userId\":\"W10001\"},{\"id\":3,\"username\":\"张无忌\",\"userId\":\"W10002\"}]','insert','admin','系统管理员','2024-03-18T11:59:32+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (265,1013,'TZ1013',NULL,'SP1012','待审批提醒','系统管理员 提交了<a>《出差-系统管理员-20240318115906》</a>，请及时处理',NULL,NULL,'进行中','通知',NULL,'2024-03-18 11:59:32','是',NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhUpdate','admin','系统管理员','2024-03-18T12:00:57+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (266,1014,'RZ1014','MB1011',NULL,'日报-系统管理员-20240318115947',NULL,NULL,NULL,'进行中','日志','[{\"id\":\"textarea_viVMAbBd\",\"component\":{\"items\":\"\",\"value\":\"开发导航网站爬虫\",\"label\":\"今日工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_2JfgryfS\",\"component\":{\"items\":\"\",\"value\":\"继续完善爬虫脚本\",\"label\":\"明日工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_S7WaQrQQ\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','2024-03-18 12:00:16','否',NULL,NULL,'admin','admin,W10001,W10002',NULL,NULL,NULL,NULL,'[{\"id\":1,\"username\":\"系统管理员\",\"userId\":\"admin\"},{\"id\":2,\"username\":\"张三丰\",\"userId\":\"W10001\"},{\"id\":3,\"username\":\"张无忌\",\"userId\":\"W10002\"}]',NULL,NULL,NULL,'insert','admin','系统管理员','2024-03-18T12:00:16+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (267,1015,'TZ1015',NULL,'RZ1014','日志邀请提醒','系统管理员 将<a>《日报-系统管理员-20240318115947》</a>日志发送给您，请及时查看',NULL,NULL,'进行中','通知','[{\"id\":\"textarea_viVMAbBd\",\"component\":{\"items\":\"\",\"value\":\"开发导航网站爬虫\",\"label\":\"今日工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_2JfgryfS\",\"component\":{\"items\":\"\",\"value\":\"继续完善爬虫脚本\",\"label\":\"明日工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_S7WaQrQQ\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','2024-03-18 12:00:16','是',NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhUpdate','admin','系统管理员','2024-03-18T12:00:46+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (268,1016,'TZ1016',NULL,'RZ1014','日志邀请提醒','系统管理员 将<a>《日报-系统管理员-20240318115947》</a>日志发送给您，请及时查看',NULL,NULL,'进行中','通知','[{\"id\":\"textarea_viVMAbBd\",\"component\":{\"items\":\"\",\"value\":\"开发导航网站爬虫\",\"label\":\"今日工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_2JfgryfS\",\"component\":{\"items\":\"\",\"value\":\"继续完善爬虫脚本\",\"label\":\"明日工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_S7WaQrQQ\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','2024-03-18 12:00:16','否',NULL,NULL,'W10001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T12:00:16+08:00');
INSERT INTO `task` (`id`,`idSequence`,`taskId`,`taskTemplateId`,`taskBizId`,`taskTitle`,`taskDesc`,`taskLevel`,`taskTag`,`taskStatus`,`taskType`,`taskContent`,`taskCreateAt`,`taskReadStatus`,`taskStartAt`,`taskEndAt`,`taskManagerId`,`taskMemberIdList`,`taskCommentList`,`taskRelationList`,`taskFileList`,`taskChildList`,`taskNoticeConfig`,`taskAuditUserIdList`,`taskAuditedUserIdList`,`taskAuditConfig`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (269,1017,'TZ1017',NULL,'RZ1014','日志邀请提醒','系统管理员 将<a>《日报-系统管理员-20240318115947》</a>日志发送给您，请及时查看',NULL,NULL,'进行中','通知','[{\"id\":\"textarea_viVMAbBd\",\"component\":{\"items\":\"\",\"value\":\"开发导航网站爬虫\",\"label\":\"今日工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_2JfgryfS\",\"component\":{\"items\":\"\",\"value\":\"继续完善爬虫脚本\",\"label\":\"明日工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_S7WaQrQQ\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','2024-03-18 12:00:16','否',NULL,NULL,'W10002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhInsert',NULL,NULL,'2024-03-18T12:00:16+08:00');

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: task_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task_template`;
CREATE TABLE `task_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` int(11) DEFAULT NULL COMMENT '自增ID;1001++',
  `taskTemplateId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板ID;',
  `taskTemplateIcon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板icon;',
  `taskTemplateName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板名称;',
  `taskTemplateType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板类型;审批,日志',
  `taskTemplateGroup` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板分组',
  `taskTemplateForm` text COLLATE utf8mb4_bin COMMENT 'form表单;',
  `taskTemplatePersonList` text COLLATE utf8mb4_bin COMMENT '审批人列表;',
  `taskTemplateNoticePersonList` text COLLATE utf8mb4_bin COMMENT '抄送人列表;',
  `taskTemplateRemark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板备注',
  `taskTemplateCreateAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务模板创建时间;',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC COMMENT = '任务模板表;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: task_template
# ------------------------------------------------------------

INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (5,1005,'MB1005','/img/task-template/10009.png','通用审批','审批','行政','[{\"id\":\"input_MrOupGFE\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"所在公司\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_NeiYFBxK\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"申请事项\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_6jGmE11Z\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"申请内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_-oEjePna\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"附件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_AM6mW38O\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传图片\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','[{\"id\":21,\"username\":\"超级管理员\",\"userId\":\"admin\"}]','[]',NULL,'2024-03-05 12:00:02','jhUpdate','F00994','钟储兵','2024-03-13T17:01:33+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,1006,'MB1006','/img/task-template/10006.png','加班','审批','人事','[{\"id\":\"select_72gYXdaW\",\"component\":{\"items\":\"工作日加班,休息日加班,节假日加班\",\"value\":null,\"label\":\"加班类型\",\"required\":true,\"typeDesc\":\"选择框\",\"type\":\"select\",\"tag\":\"v-autocomplete\",\"icon\":\"mdi-select\"}},{\"id\":\"date_x6l5obDH\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"开始时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"date_JuCaMpCg\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"结束时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"input_CdPstnfS\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"时长(小时)\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-format-text-rotation-none\"}},{\"id\":\"textarea_-LHFu4mr\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"加班原因\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_gGIYCglX\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','[]','[]',NULL,'2024-03-05 12:00:02','jhUpdate','admin','系统管理员','2024-03-18T11:51:48+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,1007,'MB1007','/img/task-template/10011.png','出差','审批','人事','[{\"id\":\"date_H0zlNRIo\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"开始时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"date_XyfSepVI\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"结束时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"input_KXMRh0HH\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"时长(小时)\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-format-text-rotation-none\"}},{\"id\":\"textarea_bvJM6c_a\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"出差事由\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_cpYHjsQV\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','[]','[]',NULL,'2024-03-05 12:00:02','jhUpdate','admin','系统管理员','2024-03-18T11:53:16+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,1008,'MB1008','/img/task-template/10013.png','离职','审批','人事','[{\"id\":\"date_KWIPEplm\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"计划离职日期\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"select_gZlNlTAl\",\"component\":{\"items\":\"家庭原因,身体原因\",\"value\":null,\"label\":\"离职原因\",\"required\":true,\"typeDesc\":\"选择框\",\"type\":\"select\",\"tag\":\"v-autocomplete\",\"icon\":\"mdi-select\"}},{\"id\":\"textarea_BNR0_Zc5\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"备注\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_7FBPjIw_\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}}]','[]','[]',NULL,'2024-03-05 12:00:02','jhUpdate','admin','系统管理员','2024-03-18T11:57:55+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (9,1009,'MB1009','/img/task-template/10005.png','调动申请','审批','其他','[{\"id\":\"input_MrOupGFE\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"所在公司\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"input_NeiYFBxK\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"申请事项\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_6jGmE11Z\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"申请内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_-oEjePna\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"附件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-form-textarea\"}}]','[{\"id\":5451,\"username\":\"钟储兵\",\"userId\":\"F00994\",\"qiweiId\":\"ChuBing\"},{\"id\":5447,\"username\":\"刘计\",\"userId\":\"F00992\",\"qiweiId\":\"colin\"}]','[{\"id\":5451,\"username\":\"钟储兵\",\"userId\":\"F00994\",\"qiweiId\":\"ChuBing\"}]',NULL,'2024-03-05 12:00:02','jhUpdate','admin','超级管理员','2024-03-11T14:35:30+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (10,1010,'MB1010','/img/task-template/10004.png','请假','审批','人事','[{\"id\":\"select_CqpydmlG\",\"component\":{\"items\":\"事假,年假,调休假\",\"value\":null,\"label\":\"请假类型\",\"required\":true,\"typeDesc\":\"选择框\",\"type\":\"select\",\"tag\":\"v-autocomplete\",\"icon\":\"mdi-select\"}},{\"id\":\"date_1T9HgGQ8\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"开始时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"date_YMeNVqmS\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"结束时间\",\"required\":true,\"typeDesc\":\"日期选择框\",\"type\":\"date\",\"tag\":\"v-date-picker\",\"icon\":\"mdi-calendar-range\"}},{\"id\":\"input_Q5-zMm5F\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"时长(小时)\",\"required\":true,\"typeDesc\":\"单行文本框\",\"type\":\"input\",\"tag\":\"v-text-field\",\"icon\":\"mdi-format-text-rotation-none\"}},{\"id\":\"textarea_nuIkSJOT\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"请假事由\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"file_yQEc43Rx\",\"component\":{\"items\":\"\",\"value\":[],\"label\":\"上传文件\",\"required\":false,\"typeDesc\":\"上传文件\",\"type\":\"file\",\"tag\":\"v-file-input\",\"icon\":\"mdi-file-account-outline\"}},{\"id\":\"select_7dB86np_\",\"component\":{\"items\":\"信息部\",\"value\":null,\"label\":\"所在部门\",\"required\":false,\"typeDesc\":\"选择框\",\"type\":\"select\",\"tag\":\"v-autocomplete\",\"icon\":\"mdi-select\"}}]','[{\"id\":21,\"username\":\"超级管理员\",\"userId\":\"admin\"}]','[]',NULL,'2024-03-08 14:31:36','jhUpdate','admin','超级管理员','2024-03-09T22:28:23+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (12,1011,'MB1011','/img/task-template/10001.png','日报','日志','其他','[{\"id\":\"textarea_viVMAbBd\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"今日工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_2JfgryfS\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"明日工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_S7WaQrQQ\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','[]','[]',NULL,'2024-03-15 15:40:36','jhUpdate','admin','超级管理员','2024-03-15T15:50:33+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (13,1012,'MB1012','/img/task-template/10004.png','周报','日志','其他','[{\"id\":\"textarea_fmdTD1yn\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"本周工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_kBAt5LGf\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"下周工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_MXfTXLAN\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','[]','[]',NULL,'2024-03-15 15:40:47','jhUpdate','admin','超级管理员','2024-03-15T15:51:05+08:00');
INSERT INTO `task_template` (`id`,`idSequence`,`taskTemplateId`,`taskTemplateIcon`,`taskTemplateName`,`taskTemplateType`,`taskTemplateGroup`,`taskTemplateForm`,`taskTemplatePersonList`,`taskTemplateNoticePersonList`,`taskTemplateRemark`,`taskTemplateCreateAt`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (14,1013,'MB1013','/img/task-template/10004.png','月报','日志','其他','[{\"id\":\"textarea_X4q6RVYC\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"本月工作的内容\",\"required\":true,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_e7ked3Jw\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"下月工作的内容\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}},{\"id\":\"textarea_TK1Bro4j\",\"component\":{\"items\":\"\",\"value\":null,\"label\":\"遇到的问题\",\"required\":false,\"typeDesc\":\"多行文本框\",\"type\":\"textarea\",\"tag\":\"v-textarea\",\"icon\":\"mdi-form-textarea\"}}]','[]','[]',NULL,'2024-03-15 15:40:56','jhUpdate','admin','超级管理员','2024-03-15T15:51:54+08:00');

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_task
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_task` AS
select
  `jianghu_oa`.`task`.`id` AS `id`,
  `jianghu_oa`.`task`.`idSequence` AS `idSequence`,
  `jianghu_oa`.`task`.`taskId` AS `taskId`,
  `jianghu_oa`.`task`.`taskTemplateId` AS `taskTemplateId`,
  `jianghu_oa`.`task`.`taskBizId` AS `taskBizId`,
  `jianghu_oa`.`task`.`taskTitle` AS `taskTitle`,
  `jianghu_oa`.`task`.`taskDesc` AS `taskDesc`,
  `jianghu_oa`.`task`.`taskLevel` AS `taskLevel`,
  `jianghu_oa`.`task`.`taskTag` AS `taskTag`,
  `jianghu_oa`.`task`.`taskStatus` AS `taskStatus`,
  `jianghu_oa`.`task`.`taskType` AS `taskType`,
  `jianghu_oa`.`task`.`taskContent` AS `taskContent`,
  `jianghu_oa`.`task`.`taskCreateAt` AS `taskCreateAt`,
  `jianghu_oa`.`task`.`taskReadStatus` AS `taskReadStatus`,
  `jianghu_oa`.`task`.`taskStartAt` AS `taskStartAt`,
  `jianghu_oa`.`task`.`taskEndAt` AS `taskEndAt`,
  `jianghu_oa`.`task`.`taskManagerId` AS `taskManagerId`,
  `jianghu_oa`.`task`.`taskMemberIdList` AS `taskMemberIdList`,
  `jianghu_oa`.`task`.`taskCommentList` AS `taskCommentList`,
  `jianghu_oa`.`task`.`taskRelationList` AS `taskRelationList`,
  `jianghu_oa`.`task`.`taskFileList` AS `taskFileList`,
  `jianghu_oa`.`task`.`taskChildList` AS `taskChildList`,
  `jianghu_oa`.`task`.`taskNoticeConfig` AS `taskNoticeConfig`,
  `jianghu_oa`.`task`.`taskAuditUserIdList` AS `taskAuditUserIdList`,
  `jianghu_oa`.`task`.`taskAuditedUserIdList` AS `taskAuditedUserIdList`,
  `jianghu_oa`.`task`.`taskAuditConfig` AS `taskAuditConfig`,
  `jianghu_oa`.`task`.`operation` AS `operation`,
  `jianghu_oa`.`task`.`operationByUserId` AS `operationByUserId`,
  `jianghu_oa`.`task`.`operationByUser` AS `operationByUser`,
  `jianghu_oa`.`task`.`operationAt` AS `operationAt`,
  `jianghu_oa`.`task_template`.`taskTemplateName` AS `taskTemplateName`,
  `_view01_user`.`username` AS `username`
from
  (
  (
    `jianghu_oa`.`task`
    join `jianghu_oa`.`task_template` on(
    (
      `jianghu_oa`.`task`.`taskTemplateId` = `jianghu_oa`.`task_template`.`taskTemplateId`
    )
    )
  )
  join `jianghu_oa`.`_view01_user` on(
    (
    `jianghu_oa`.`task`.`taskManagerId` = `_view01_user`.`userId`
    )
  )
  );



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_user_group
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_user_group` AS
select
  `_view01_user`.`id` AS `id`,
  `_view01_user`.`idSequence` AS `idSequence`,
  `_view01_user`.`userId` AS `userId`,
  `_view01_user`.`username` AS `username`,
  `_view01_user`.`phoneNumber` AS `phoneNumber`,
  `_view01_user`.`email` AS `email`,
  `_view01_user`.`userStatus` AS `userStatus`,
  `_view01_user`.`hrOrgRoleList` AS `hrOrgRoleList`,
  `_view01_user`.`qiweiId` AS `qiweiId`,
  `_view01_user`.`wechatId` AS `wechatId`,
  `_view01_user`.`userConfig` AS `userConfig`,
  `_view01_user`.`password` AS `password`,
  `_view01_user`.`md5Salt` AS `md5Salt`,
  `_view01_user`.`clearTextPassword` AS `clearTextPassword`,
  `_view01_user`.`operation` AS `operation`,
  `_view01_user`.`operationByUserId` AS `operationByUserId`,
  `_view01_user`.`operationByUser` AS `operationByUser`,
  `_view01_user`.`operationAt` AS `operationAt`,
  `_group`.`groupName` AS `groupName`
from
  (
  (
    `jianghu_oa`.`_view01_user`
    join `jianghu_oa`.`_user_group_role` on(
    (
      `_view01_user`.`userId` = `_user_group_role`.`userId`
    )
    )
  )
  join `jianghu_oa`.`_group` on(
    (
    `_user_group_role`.`groupId` = `_group`.`groupId`
    )
  )
  );



