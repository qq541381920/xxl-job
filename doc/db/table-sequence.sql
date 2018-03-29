-----------------------------------------------------------
-- Export file for user XXL_JOB@//10.20.7.101/LIONNEWTEST --
-- Created by niuzhanbing on 2018/3/23, 11:36:28 ----------
-----------------------------------------------------------

--set define off
--spool table-sequence.log

--prompt
--prompt Creating table XXL_JOB_JOB_DETAILS
--prompt ==================================
--prompt
create table XXL_JOB.XXL_JOB_JOB_DETAILS
(
  sched_name        VARCHAR2(120) not null,
  job_name          VARCHAR2(200) not null,
  job_group         VARCHAR2(200) not null,
  description       VARCHAR2(250),
  job_class_name    VARCHAR2(250) not null,
  is_durable        VARCHAR2(1) not null,
  is_nonconcurrent  VARCHAR2(1) not null,
  is_update_data    VARCHAR2(1) not null,
  requests_recovery VARCHAR2(1) not null,
  job_data          BLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_JOB_DETAILS
  is '工作联系方式表';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.job_name
  is '工作名称';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.job_group
  is '工作组';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.description
  is '说明';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.job_class_name
  is '工作类名';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.is_durable
  is '是否持久化，0不持久化，1持久化';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.is_nonconcurrent
  is '并发JOB@DisallowConcurrentExecution';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.is_update_data
  is '持久jobDataMap@PersistJobDataAfterExecution';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.requests_recovery
  is '请求恢复';
comment on column XXL_JOB.XXL_JOB_JOB_DETAILS.job_data
  is '工作记录';
alter table XXL_JOB.XXL_JOB_JOB_DETAILS
  add primary key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_TRIGGERS
--prompt ===============================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGERS
(
  sched_name     VARCHAR2(120) not null,
  trigger_name   VARCHAR2(200) not null,
  trigger_group  VARCHAR2(200) not null,
  job_name       VARCHAR2(200) not null,
  job_group      VARCHAR2(200) not null,
  description    VARCHAR2(250),
  next_fire_time NUMBER(13),
  prev_fire_time NUMBER(13),
  priority       INTEGER,
  trigger_state  VARCHAR2(16) not null,
  trigger_type   VARCHAR2(8) not null,
  start_time     NUMBER(13) not null,
  end_time       NUMBER(13),
  calendar_name  VARCHAR2(200),
  misfire_instr  NUMBER(5),
  job_data       BLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGERS
  is '触发表';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.trigger_group
  is '触发组';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.job_name
  is '任务名称';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.job_group
  is '任务组';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.description
  is '任务描述';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.next_fire_time
  is '下次执行时间';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.prev_fire_time
  is '上次执行时间';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.priority
  is '优先级';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.trigger_state
  is '任务状态';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.trigger_type
  is '触发类型CRON表达式';
comment on column XXL_JOB.XXL_JOB_TRIGGERS.start_time
  is '开始时间';
alter table XXL_JOB.XXL_JOB_TRIGGERS
  add primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table XXL_JOB.XXL_JOB_TRIGGERS
  add foreign key (SCHED_NAME, JOB_NAME, JOB_GROUP)
  references XXL_JOB.XXL_JOB_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP);

--prompt
--prompt Creating table XXL_JOB_BLOB_TRIGGERS
--prompt ====================================
--prompt
create table XXL_JOB.XXL_JOB_BLOB_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  blob_data     BLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table XXL_JOB.XXL_JOB_BLOB_TRIGGERS
  is '触发器记录表';
comment on column XXL_JOB.XXL_JOB_BLOB_TRIGGERS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_BLOB_TRIGGERS.trigger_name
  is '触发器名称';
comment on column XXL_JOB.XXL_JOB_BLOB_TRIGGERS.trigger_group
  is '触发器组';
comment on column XXL_JOB.XXL_JOB_BLOB_TRIGGERS.blob_data
  is '触发内容';
alter table XXL_JOB.XXL_JOB_BLOB_TRIGGERS
  add primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table XXL_JOB.XXL_JOB_BLOB_TRIGGERS
  add foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references XXL_JOB.XXL_JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

--prompt
--prompt Creating table XXL_JOB_CALENDARS
--prompt ================================
--prompt
create table XXL_JOB.XXL_JOB_CALENDARS
(
  sched_name    VARCHAR2(120) not null,
  calendar_name VARCHAR2(200) not null,
  calendar      BLOB not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table XXL_JOB.XXL_JOB_CALENDARS
  is '触发日历表';
comment on column XXL_JOB.XXL_JOB_CALENDARS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_CALENDARS.calendar_name
  is '日历名称';
comment on column XXL_JOB.XXL_JOB_CALENDARS.calendar
  is '日历内容';
alter table XXL_JOB.XXL_JOB_CALENDARS
  add primary key (SCHED_NAME, CALENDAR_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

--prompt
--prompt Creating table XXL_JOB_CRON_TRIGGERS
--prompt ====================================
--prompt
create table XXL_JOB.XXL_JOB_CRON_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  cron_expression VARCHAR2(200) not null,
  time_zone_id    VARCHAR2(80)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_CRON_TRIGGERS
  is '触发器执行计划表';
comment on column XXL_JOB.XXL_JOB_CRON_TRIGGERS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_CRON_TRIGGERS.trigger_name
  is '触发器名称';
comment on column XXL_JOB.XXL_JOB_CRON_TRIGGERS.trigger_group
  is '触发器组';
comment on column XXL_JOB.XXL_JOB_CRON_TRIGGERS.cron_expression
  is '执行计划表达式';
comment on column XXL_JOB.XXL_JOB_CRON_TRIGGERS.time_zone_id
  is '时区';
alter table XXL_JOB.XXL_JOB_CRON_TRIGGERS
  add primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table XXL_JOB.XXL_JOB_CRON_TRIGGERS
  add foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references XXL_JOB.XXL_JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

--prompt
--prompt Creating table XXL_JOB_FIRED_TRIGGERS
--prompt =====================================
--prompt
create table XXL_JOB.XXL_JOB_FIRED_TRIGGERS
(
  sched_name        VARCHAR2(120) not null,
  entry_id          VARCHAR2(95) not null,
  trigger_name      VARCHAR2(200) not null,
  trigger_group     VARCHAR2(200) not null,
  instance_name     VARCHAR2(200) not null,
  fired_time        NUMBER(13) not null,
  sched_time        NUMBER(13) not null,
  priority          INTEGER not null,
  state             VARCHAR2(16) not null,
  job_name          VARCHAR2(200),
  job_group         VARCHAR2(200),
  is_nonconcurrent  VARCHAR2(1),
  requests_recovery VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_FIRED_TRIGGERS
  is '在执行触发表';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.entry_id
  is '执行ID';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.trigger_name
  is '触发器名称';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.trigger_group
  is '触发器组';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.instance_name
  is '列名';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.fired_time
  is '触发时间';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.priority
  is '权重';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.state
  is '执行状态';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.job_name
  is '工作名';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.job_group
  is '工作组';
comment on column XXL_JOB.XXL_JOB_FIRED_TRIGGERS.requests_recovery
  is '请求恢复';
alter table XXL_JOB.XXL_JOB_FIRED_TRIGGERS
  add primary key (SCHED_NAME, ENTRY_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_LOCKS
--prompt ============================
--prompt
create table XXL_JOB.XXL_JOB_LOCKS
(
  sched_name VARCHAR2(120) not null,
  lock_name  VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_LOCKS
  is '执行计划锁表';
comment on column XXL_JOB.XXL_JOB_LOCKS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_LOCKS.lock_name
  is '锁名称';
alter table XXL_JOB.XXL_JOB_LOCKS
  add primary key (SCHED_NAME, LOCK_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_PAUSED_TRIGGER_GRPS
--prompt ==========================================
--prompt
create table XXL_JOB.XXL_JOB_PAUSED_TRIGGER_GRPS
(
  sched_name    VARCHAR2(120) not null,
  trigger_group VARCHAR2(200) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table XXL_JOB.XXL_JOB_PAUSED_TRIGGER_GRPS
  is '暂停的触发主表';
comment on column XXL_JOB.XXL_JOB_PAUSED_TRIGGER_GRPS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_PAUSED_TRIGGER_GRPS.trigger_group
  is '触发器组';
alter table XXL_JOB.XXL_JOB_PAUSED_TRIGGER_GRPS
  add primary key (SCHED_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

--prompt
--prompt Creating table XXL_JOB_SCHEDULER_STATE
--prompt ======================================
--prompt
create table XXL_JOB.XXL_JOB_SCHEDULER_STATE
(
  sched_name        VARCHAR2(120) not null,
  instance_name     VARCHAR2(200) not null,
  last_checkin_time NUMBER(13) not null,
  checkin_interval  NUMBER(13) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_SCHEDULER_STATE
  is '调度状态表';
comment on column XXL_JOB.XXL_JOB_SCHEDULER_STATE.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_SCHEDULER_STATE.instance_name
  is '列名';
comment on column XXL_JOB.XXL_JOB_SCHEDULER_STATE.last_checkin_time
  is '最后调度检查时间';
comment on column XXL_JOB.XXL_JOB_SCHEDULER_STATE.checkin_interval
  is '调度检查间隔';
alter table XXL_JOB.XXL_JOB_SCHEDULER_STATE
  add primary key (SCHED_NAME, INSTANCE_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_SIMPLE_TRIGGERS
--prompt ======================================
--prompt
create table XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS
(
  sched_name      VARCHAR2(120) not null,
  trigger_name    VARCHAR2(200) not null,
  trigger_group   VARCHAR2(200) not null,
  repeat_count    NUMBER(7) not null,
  repeat_interval NUMBER(12) not null,
  times_triggered NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS
  is 'simple触发表';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.sched_name
  is 'Quartz实例名';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.trigger_name
  is '触发器名称';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.trigger_group
  is '触发器组';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.repeat_count
  is '重复执行次数';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.repeat_interval
  is '执行时间间隔';
comment on column XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS.times_triggered
  is '作业运行的次数';
alter table XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS
  add primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table XXL_JOB.XXL_JOB_SIMPLE_TRIGGERS
  add foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references XXL_JOB.XXL_JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

--prompt
--prompt Creating table XXL_JOB_SIMPROP_TRIGGERS
--prompt =======================================
--prompt
create table XXL_JOB.XXL_JOB_SIMPROP_TRIGGERS
(
  sched_name    VARCHAR2(120) not null,
  trigger_name  VARCHAR2(200) not null,
  trigger_group VARCHAR2(200) not null,
  str_prop_1    VARCHAR2(512),
  str_prop_2    VARCHAR2(512),
  str_prop_3    VARCHAR2(512),
  int_prop_1    INTEGER,
  int_prop_2    INTEGER,
  long_prop_1   NUMBER,
  long_prop_2   NUMBER,
  dec_prop_1    NUMBER(13,4),
  dec_prop_2    NUMBER(13,4),
  bool_prop_1   VARCHAR2(1),
  bool_prop_2   VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table XXL_JOB.XXL_JOB_SIMPROP_TRIGGERS
  add primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table XXL_JOB.XXL_JOB_SIMPROP_TRIGGERS
  add foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  references XXL_JOB.XXL_JOB_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

--prompt
--prompt Creating table XXL_JOB_TRIGGER_GROUP
--prompt ====================================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGER_GROUP
(
  id           NUMBER(11) not null,
  app_name     VARCHAR2(64) not null,
  title        VARCHAR2(22) not null,
  group_order  NUMBER(4) default '0',
  address_type NUMBER(4) default '0',
  address_list VARCHAR2(512)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGER_GROUP
  is '执行器信息表，维护任务执行器信息';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.id
  is '主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.app_name
  is '执行器AppName';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.title
  is '执行器名称';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.group_order
  is '排序';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.address_type
  is '执行器地址类型：0=自动注册、1=手动录入';
comment on column XXL_JOB.XXL_JOB_TRIGGER_GROUP.address_list
  is '执行器地址列表，多地址逗号分隔';
alter table XXL_JOB.XXL_JOB_TRIGGER_GROUP
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_TRIGGER_INFO
--prompt ===================================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGER_INFO
(
  id                      NUMBER(11) not null,
  job_group               NUMBER(11) not null,
  job_cron                VARCHAR2(128) not null,
  job_desc                VARCHAR2(255) not null,
  add_time                DATE,
  update_time             DATE,
  author                  VARCHAR2(64),
  alarm_email             VARCHAR2(255),
  executor_route_strategy VARCHAR2(50),
  executor_handler        VARCHAR2(255),
  executor_param          VARCHAR2(512),
  executor_block_strategy VARCHAR2(50),
  executor_fail_strategy  VARCHAR2(50),
  glue_type               VARCHAR2(50) not null,
  glue_source             CLOB,
  glue_remark             VARCHAR2(128),
  glue_updatetime         DATE,
  child_jobid             VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGER_INFO
  is '调度扩展信息表';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.id
  is '执行器主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.job_group
  is '工作组';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.job_cron
  is '任务执行CRON';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.author
  is '作者';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.alarm_email
  is '报警邮件';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.executor_route_strategy
  is '执行器路由策略';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.executor_handler
  is '执行器任务handler';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.executor_param
  is '执行器任务参数';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.executor_block_strategy
  is '阻塞处理策略';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.executor_fail_strategy
  is '失败处理策略';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.glue_type
  is 'GLUE类型';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.glue_source
  is 'GLUE源代码';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.glue_remark
  is 'GLUE备注';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.glue_updatetime
  is 'GLUE更新时间';
comment on column XXL_JOB.XXL_JOB_TRIGGER_INFO.child_jobid
  is '子任务ID，多个逗号分隔';
alter table XXL_JOB.XXL_JOB_TRIGGER_INFO
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_TRIGGER_LOG
--prompt ==================================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGER_LOG
(
  id               NUMBER(11) not null,
  job_group        NUMBER(11) not null,
  job_id           NUMBER(11) not null,
  glue_type        VARCHAR2(50),
  executor_address VARCHAR2(255),
  executor_handler VARCHAR2(255),
  executor_param   VARCHAR2(512),
  trigger_time     DATE,
  trigger_code     VARCHAR2(255) default '0',
  trigger_msg      VARCHAR2(2048),
  handle_time      DATE,
  handle_code      VARCHAR2(255) default '0',
  handle_msg       VARCHAR2(2048)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGER_LOG
  is '调度日志表';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.id
  is '执行器主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.job_group
  is '工作组';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.job_id
  is '任务，主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.glue_type
  is 'GLUE类型';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.executor_address
  is '执行器地址，本次执行的地址';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.executor_handler
  is '执行器任务handler';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.executor_param
  is '执行器任务参数';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.trigger_time
  is '调度-时间';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.trigger_code
  is '调度-结果';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.trigger_msg
  is '调度-日志';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.handle_time
  is '执行-时间';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.handle_code
  is '执行-状态';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOG.handle_msg
  is '执行-日志';
alter table XXL_JOB.XXL_JOB_TRIGGER_LOG
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_TRIGGER_LOGGLUE
--prompt ======================================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE
(
  id          NUMBER(11) not null,
  job_id      NUMBER(11) not null,
  glue_type   VARCHAR2(50),
  glue_source CLOB,
  glue_remark VARCHAR2(128) not null,
  add_time    TIMESTAMP(6),
  update_time TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE
  is '任务GLUE日志支持GLUE的版本回溯功能';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE.id
  is '执行器主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE.job_id
  is '任务，主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE.glue_type
  is 'GLUE类型';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE.glue_source
  is 'GLUE源代码';
comment on column XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE.glue_remark
  is 'GLUE备注';
alter table XXL_JOB.XXL_JOB_TRIGGER_LOGGLUE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating table XXL_JOB_TRIGGER_REGISTRY
--prompt =======================================
--prompt
create table XXL_JOB.XXL_JOB_TRIGGER_REGISTRY
(
  id             NUMBER(11) not null,
  registry_group VARCHAR2(255) not null,
  registry_key   VARCHAR2(255) not null,
  registry_value VARCHAR2(255) not null,
  update_time    DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table XXL_JOB.XXL_JOB_TRIGGER_REGISTRY
  is '执行器注册表';
comment on column XXL_JOB.XXL_JOB_TRIGGER_REGISTRY.id
  is '主键ID';
comment on column XXL_JOB.XXL_JOB_TRIGGER_REGISTRY.registry_group
  is '注册组';
comment on column XXL_JOB.XXL_JOB_TRIGGER_REGISTRY.registry_key
  is '注册key';
comment on column XXL_JOB.XXL_JOB_TRIGGER_REGISTRY.registry_value
  is '注册value';
comment on column XXL_JOB.XXL_JOB_TRIGGER_REGISTRY.update_time
  is '修改时间';
alter table XXL_JOB.XXL_JOB_TRIGGER_REGISTRY
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

--prompt
--prompt Creating sequence QRTZ_TRIGGER_GROUP
--prompt ====================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_GROUP
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 20;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_GROUP_SEQUENCE
--prompt =============================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_GROUP_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 2
increment by 1
nocache;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_INFO
--prompt ===================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_INFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 20;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_INFO_SEQUENCE
--prompt ============================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_INFO_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
nocache;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_LOG
--prompt ==================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 221581
increment by 1
cache 20;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_LOGGLUE
--prompt ======================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_LOGGLUE
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_LOGGLUE_SEQUENCE
--prompt ===============================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_LOGGLUE_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
nocache;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_LOG_SEQUENCE
--prompt ===========================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_LOG_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
nocache;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_REGISTRY
--prompt =======================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_REGISTRY
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;

--prompt
--prompt Creating sequence QRTZ_TRIGGER_REGISTRY_SEQUENCE
--prompt ================================================
--prompt
create sequence XXL_JOB.QRTZ_TRIGGER_REGISTRY_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
nocache;


--spool off
