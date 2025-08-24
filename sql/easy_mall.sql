DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`
(
    `id`          varchar(64)  NOT NULL COMMENT '主键',
    `item_id`     varchar(64)  NULL COMMENT '商品id',
    `category_id` varchar(64)  NULL COMMENT '商品分类id',
    `image_url`   varchar(256) NOT NULL COMMENT '轮播图地址',
    `bg_color`    varchar(32)  NULL COMMENT '背景色',
    `type`        tinyint      NOT NULL COMMENT '轮播图类型',
    `sort`        int(11)      NOT NULL COMMENT '轮播图展示顺序',
    `is_show`     tinyint      NOT NULL COMMENT '是否展示',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='轮播图表';

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`
(
    `id`               varchar(64) NOT NULL COMMENT '主键id',
    `item_name`        varchar(32) NOT NULL COMMENT '商品名称',
    `category_id`      varchar(64) NOT NULL COMMENT '商品分类id',
    `root_category_id` varchar(64) NOT NULL COMMENT '一级分类id',
    `sell_count`       int(11)     NOT NULL COMMENT '累计销售量',
    `status`           tinyint     NOT NULL COMMENT '商品状态:1-上架,2-下架',
    `content`          text        NOT NULL COMMENT '商品内容',
    `create_time`      datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品表';

DROP TABLE IF EXISTS `item_param`;
CREATE TABLE `item_param`
(
    `id`              varchar(64) NOT NULL COMMENT '主键id',
    `item_id`         varchar(64) NOT NULL COMMENT '商品id',
    `origin`          varchar(32) NULL COMMENT '产地',
    `shelf_life`      varchar(32) NULL COMMENT '保质期',
    `brand`           varchar(32) NULL COMMENT '品牌',
    `factory_name`    varchar(32) NULL COMMENT '工厂名',
    `factory_address` varchar(32) NULL COMMENT '工厂地址',
    `packaging`       varchar(32) NULL COMMENT '包装方式',
    `weight`          varchar(32) NULL COMMENT '规格重量',
    `storage_method`  varchar(32) NULL COMMENT '存储方式',
    `serving_method`  varchar(32) NULL COMMENT '食用方式',
    `create_time`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品参数表';

DROP TABLE IF EXISTS `item_spec`;
CREATE TABLE `item_spec`
(
    `id`             varchar(64)    NOT NULL COMMENT '主键id',
    `item_id`        varchar(64)    NOT NULL COMMENT '商品id',
    `spec_name`      varchar(32)    NOT NULL COMMENT '规格名称',
    `stock`          int(11)        NOT NULL COMMENT '库存',
    `discount`       decimal(4, 2)  NOT NULL COMMENT '折扣',
    `discount_price` decimal(10, 2) NOT NULL COMMENT '优惠价',
    `original_price` decimal(10, 2) NOT NULL COMMENT '原价',
    `create_time`    datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品规格表';

DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category`
(
    `id`          varchar(64)  NOT NULL COMMENT '主键id',
    `name`        varchar(32)  NOT NULL COMMENT '分类名称',
    `type`        int(11)      NOT NULL COMMENT '分类类型',
    `desc`        varchar(256) NULL COMMENT '分类描述',
    `father_id`   varchar(64)  NOT NULL COMMENT '父分类id',
    `logo_url`    varchar(256) NOT NULL COMMENT '图标地址',
    `image_url`   varchar(64)  NULL COMMENT '分类图地址',
    `bg_color`    varchar(32)  NULL COMMENT '背景颜色',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品分类表';

DROP TABLE IF EXISTS `item_comment`;
CREATE TABLE `item_comment`
(
    `id`           varchar(64)  NOT NULL COMMENT '主键id',
    `user_id`      varchar(64)  NULL COMMENT '用户id',
    `item_id`      varchar(64)  NOT NULL COMMENT '商品id',
    `item_spec_id` varchar(64)  NULL COMMENT '商品规格id',
    `level`        tinyint      NOT NULL COMMENT '评价等级:1-好评,2-中评,3-差评',
    `content`      varchar(256) NOT NULL COMMENT '评价内容',
    `create_time`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品评价表';

DROP TABLE IF EXISTS `item_img`;
CREATE TABLE `item_img`
(
    `id`          varchar(64)  NOT NULL COMMENT '主键id',
    `item_id`     varchar(64)  NOT NULL COMMENT '商品id',
    `url`         varchar(256) NOT NULL COMMENT '商品图片地址',
    `sort`        int(11)      NOT NULL COMMENT '顺序',
    `is_main`     tinyint      NOT NULL COMMENT '是否主图',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='商品图片表';

DROP TABLE IF EXISTS `order_rel_item`;
CREATE TABLE `order_rel_item`
(
    `id`             varchar(64)    NOT NULL COMMENT '主键id',
    `order_id`       varchar(64)    NOT NULL COMMENT '订单id',
    `item_id`        varchar(64)    NOT NULL COMMENT '商品id',
    `item_img`       varchar(256)   NOT NULL COMMENT '商品图片',
    `item_name`      varchar(32)    NOT NULL COMMENT '商品名称',
    `item_spec_id`   varchar(64)    NOT NULL COMMENT '商品规格id',
    `item_spec_name` varchar(32)    NOT NULL COMMENT '商品规格名称',
    `price`          decimal(10, 2) NOT NULL COMMENT '成交价格',
    `count`          int(11)        NOT NULL COMMENT '成交数量',
    `create_time`    datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='订单商品关联表';

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`
(
    `id`               varchar(64)    NOT NULL COMMENT '主键id',
    `user_id`          varchar(64)    NOT NULL COMMENT '用户id',
    `receiver_name`    varchar(32)    NOT NULL COMMENT '收件人姓名',
    `receiver_mobile`  varchar(32)    NOT NULL COMMENT '收件人手机号',
    `receiver_address` varchar(128)   NOT NULL COMMENT '收件地址',
    `total_pay`        decimal(10, 2) NOT NULL COMMENT '订单总价格',
    `actual_pay`       decimal(10, 2) NOT NULL COMMENT '实际支付总价格',
    `post_pay`         decimal(10, 2) NOT NULL COMMENT '邮费',
    `pay_method`       tinyint        NOT NULL COMMENT '支付方式',
    `buyer_msg`        varchar(256)   NULL COMMENT '买家留言',
    `extra`            varchar(32)    NULL COMMENT '扩展字段',
    `is_comment`       tinyint        NOT NULL COMMENT '买家是否评价:0-未评价,1-已评价',
    `is_delete`        tinyint        NOT NULL COMMENT '逻辑删除:0-未删除,1-已删除',
    `create_time`      datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='订单表';

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`
(
    `id`           varchar(64) NOT NULL COMMENT '主键id',
    `order_id`     varchar(64) NOT NULL COMMENT '订单id',
    `order_status` int(11)     NOT NULL COMMENT '订单状态',
    `pay_time`     datetime    NULL COMMENT '支付成功时间',
    `deliver_time` datetime    NULL COMMENT '发货时间',
    `success_time` datetime    NULL COMMENT '交易成功时间',
    `close_time`   datetime    NULL COMMENT '交易关闭时间',
    `comment_time` datetime    NULL COMMENT '评价时间',
    `create_time`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`order_id`)
) COMMENT ='订单状态表';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`          varchar(64)  NOT NULL COMMENT '主键id',
    `username`    varchar(32)  NOT NULL COMMENT '用户名',
    `password`    varchar(32)  NOT NULL COMMENT '密码',
    `name`        varchar(128) NULL COMMENT '真实姓名',
    `face`        varchar(256) NOT NULL COMMENT '头像',
    `mobile`      varchar(32)  NULL COMMENT '手机号',
    `email`       varchar(32)  NULL COMMENT '邮箱地址',
    `sex`         int(11)      NULL COMMENT '性别:1-男,2-女,3-保密',
    `birthday`    date         NULL COMMENT '生日',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='用户表';

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`
(
    `id`          varchar(64)  NOT NULL COMMENT '主键id',
    `user_id`     varchar(64)  NOT NULL COMMENT '用户id',
    `receiver`    varchar(32)  NOT NULL COMMENT '收件人姓名',
    `mobile`      varchar(32)  NOT NULL COMMENT '收件人手机号',
    `province`    varchar(32)  NOT NULL COMMENT '省份',
    `city`        varchar(32)  NOT NULL COMMENT '城市',
    `district`    varchar(32)  NOT NULL COMMENT '区县',
    `detail`      varchar(128) NOT NULL COMMENT '详细地址',
    `extra`       varchar(128) NULL COMMENT '扩展字段',
    `is_default`  int(11)      NOT NULL COMMENT '是否默认地址',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) COMMENT ='用户地址表';