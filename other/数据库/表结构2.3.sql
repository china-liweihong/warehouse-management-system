USE [wms]
GO
/****** Object:  Table [dbo].[Item_Users]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_Users](
	[users_ID] [char](5) NOT NULL,
	[users_password] [char](15) NOT NULL,
	[users_name] [char](10) NOT NULL,
	[users_identity] [char](10) NULL,
	[users_phone] [char](20) NULL,
	[users_sex] [char](2) NULL,
 CONSTRAINT [PK__Users__EAA0ED737F60ED59] PRIMARY KEY CLUSTERED 
(
	[users_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_UMessage]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_UMessage](
	[message_ID] [int] IDENTITY(1,1) NOT NULL,
	[message_type] [char](20) NOT NULL,
	[message_content] [text] NOT NULL,
	[message_date] [datetime] NOT NULL,
	[message_send_ID] [char](13) NOT NULL,
	[message_receive_ID] [char](13) NOT NULL,
	[message_state] [char](1) NOT NULL,
	[message_title] [char](40) NOT NULL,
 CONSTRAINT [PK__CMessage__0BBC6AEE4316F928] PRIMARY KEY CLUSTERED 
(
	[message_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_SLog]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_SLog](
	[log_ID] [int] IDENTITY(1,1) NOT NULL,
	[log_type] [char](20) NOT NULL,
	[operation_ID] [char](13) NULL,
	[log_date] [datetime] NOT NULL,
	[log_level] [char](10) NOT NULL,
	[log_table] [char](50) NULL,
	[log_info] [text] NOT NULL,
	[log_annonation] [text] NULL,
 CONSTRAINT [PK__SLog__9E18EB084F7CD00D] PRIMARY KEY CLUSTERED 
(
	[log_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_SDictionary]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_SDictionary](
	[field] [char](30) NOT NULL,
	[_table] [char](50) NOT NULL,
	[_index] [int] NOT NULL,
	[_indexlength] [int] NOT NULL,
 CONSTRAINT [PK__SDiction__0A24B6EC76969D2E] PRIMARY KEY CLUSTERED 
(
	[field] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_in_operation]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_in_operation](
	[storage_ID] [char](12) NOT NULL,
	[storage_time] [datetime] NULL,
	[operation_ID] [char](5) NULL,
 CONSTRAINT [PK__Item_in___AB521872173876EA] PRIMARY KEY CLUSTERED 
(
	[storage_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_company]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_company](
	[company_ID] [char](4) NOT NULL,
	[company_name] [char](50) NOT NULL,
	[company_phone] [char](20) NULL,
	[company_address] [char](100) NULL,
 CONSTRAINT [PK__Item_com__3E27767D0425A276] PRIMARY KEY CLUSTERED 
(
	[company_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_category]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_category](
	[category_ID] [char](3) NOT NULL,
	[category_name] [char](20) NOT NULL,
 CONSTRAINT [PK__Item_cat__D5B1EDEC07F6335A] PRIMARY KEY CLUSTERED 
(
	[category_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_borrow_operation]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_borrow_operation](
	[borrow_ID] [char](12) NOT NULL,
	[users_ID] [char](13) NOT NULL,
	[examine_ID] [char](5) NULL,
	[states] [char](10) NOT NULL,
	[states_time] [datetime] NULL,
	[return_operation_ID] [char](5) NULL,
	[return_text] [char](100) NULL,
 CONSTRAINT [PK__Item_bor__262C539824927208] PRIMARY KEY CLUSTERED 
(
	[borrow_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_application_operation]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_application_operation](
	[application_ID] [char](12) NOT NULL,
	[users_ID] [char](13) NOT NULL,
	[examine_ID] [char](5) NULL,
	[states] [char](10) NOT NULL,
	[states_time] [datetime] NULL,
	[application_time] [datetime] NULL,
 CONSTRAINT [PK__Item_app__3BCAD70A31EC6D26] PRIMARY KEY CLUSTERED 
(
	[application_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_out_operation]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_out_operation](
	[out_ID] [char](12) NOT NULL,
	[users_ID] [char](13) NOT NULL,
	[apply_ID] [char](12) NOT NULL,
	[out_address] [char](50) NOT NULL,
	[out_time] [datetime] NULL,
	[out_states] [char](10) NOT NULL,
	[operation_ID] [char](5) NULL,
 CONSTRAINT [PK__Item_out__D7CF7B803A81B327] PRIMARY KEY CLUSTERED 
(
	[out_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[item_code] [char](13) NOT NULL,
	[item_name] [char](50) NOT NULL,
	[item_count] [int] NOT NULL,
	[item_spec] [char](10) NOT NULL,
	[item_price] [float] NULL,
	[item_introduce] [char](50) NOT NULL,
	[item_companyID] [char](4) NULL,
	[item_categoryID] [char](3) NULL,
	[item_borrow_timelimit] [int] NOT NULL,
	[item_state] [char](20) NOT NULL,
	[item_examine] [char](20) NOT NULL,
	[item_remind] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[item_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_out_storage]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_out_storage](
	[out_ID] [char](12) NOT NULL,
	[item_code] [char](13) NOT NULL,
	[counts] [int] NOT NULL,
 CONSTRAINT [pk_Item_out_storage] PRIMARY KEY CLUSTERED 
(
	[out_ID] ASC,
	[item_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_in_storage]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_in_storage](
	[storage_ID] [char](12) NOT NULL,
	[item_code] [char](13) NOT NULL,
	[counts] [int] NOT NULL,
	[price] [float] NULL,
	[bill_code] [char](12) NULL,
	[item_slot] [char](10) NOT NULL,
	[item_batch] [char](20) NULL,
	[item_indate] [datetime] NOT NULL,
	[allow_count] [int] NOT NULL,
 CONSTRAINT [pk_Item_in_stotage] PRIMARY KEY CLUSTERED 
(
	[storage_ID] ASC,
	[item_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_application]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_application](
	[application_ID] [char](12) NOT NULL,
	[item_code] [char](13) NOT NULL,
	[counts] [int] NOT NULL,
	[application_text] [char](100) NULL,
	[application_type] [char](20) NOT NULL,
 CONSTRAINT [pk_Item_application] PRIMARY KEY CLUSTERED 
(
	[application_ID] ASC,
	[item_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_borrow]    Script Date: 12/06/2016 19:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_borrow](
	[borrow_ID] [char](12) NOT NULL,
	[item_code] [char](13) NOT NULL,
	[counts] [int] NOT NULL,
	[borrow_time] [datetime] NULL,
	[return_time] [datetime] NULL,
	[borrow_text] [char](100) NULL,
 CONSTRAINT [pk_Item_borrow] PRIMARY KEY CLUSTERED 
(
	[borrow_ID] ASC,
	[item_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK__Item__item_count__117F9D94]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD CHECK  (([item_count]>(-1)))
GO
/****** Object:  Check [CK__Item__item_price__1273C1CD]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD CHECK  (([item_price]>(0)))
GO
/****** Object:  Check [CK__Item_appl__count__37A5467C]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_application]  WITH CHECK ADD CHECK  (([counts]>(-1)))
GO
/****** Object:  Check [CK__Item_borr__count__2C3393D0]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_borrow]  WITH CHECK ADD  CONSTRAINT [CK__Item_borr__count__2C3393D0] CHECK  (([counts]>(-1)))
GO
ALTER TABLE [dbo].[Item_borrow] CHECK CONSTRAINT [CK__Item_borr__count__2C3393D0]
GO
/****** Object:  Check [CK__Item_in_s__allow__21B6055D]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_in_storage]  WITH CHECK ADD  CONSTRAINT [CK__Item_in_s__allow__21B6055D] CHECK  (([allow_count]>(-1)))
GO
ALTER TABLE [dbo].[Item_in_storage] CHECK CONSTRAINT [CK__Item_in_s__allow__21B6055D]
GO
/****** Object:  Check [CK__Item_in_s__count__1FCDBCEB]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_in_storage]  WITH CHECK ADD  CONSTRAINT [CK__Item_in_s__count__1FCDBCEB] CHECK  (([counts]>(-1)))
GO
ALTER TABLE [dbo].[Item_in_storage] CHECK CONSTRAINT [CK__Item_in_s__count__1FCDBCEB]
GO
/****** Object:  Check [CK__Item_in_s__price__20C1E124]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_in_storage]  WITH CHECK ADD  CONSTRAINT [CK__Item_in_s__price__20C1E124] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Item_in_storage] CHECK CONSTRAINT [CK__Item_in_s__price__20C1E124]
GO
/****** Object:  Check [CK__Item_out___count__403A8C7D]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_out_storage]  WITH CHECK ADD CHECK  (([counts]>(-1)))
GO
/****** Object:  Check [CK__Users__users_sex__014935CB]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__users_sex__014935CB] CHECK  (([users_sex]='女' OR [users_sex]='男'))
GO
ALTER TABLE [dbo].[Item_Users] CHECK CONSTRAINT [CK__Users__users_sex__014935CB]
GO
/****** Object:  ForeignKey [FK__Item__item_categ__145C0A3F]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([item_categoryID])
REFERENCES [dbo].[Item_category] ([category_ID])
ON UPDATE CASCADE
GO
/****** Object:  ForeignKey [FK__Item__item_compa__1367E606]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK__Item__item_compa__1367E606] FOREIGN KEY([item_companyID])
REFERENCES [dbo].[Item_company] ([company_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK__Item__item_compa__1367E606]
GO
/****** Object:  ForeignKey [FK__Item_appl__appli__35BCFE0A]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_application]  WITH CHECK ADD  CONSTRAINT [FK__Item_appl__appli__35BCFE0A] FOREIGN KEY([application_ID])
REFERENCES [dbo].[Item_application_operation] ([application_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_application] CHECK CONSTRAINT [FK__Item_appl__appli__35BCFE0A]
GO
/****** Object:  ForeignKey [FK__Item_appl__item___36B12243]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_application]  WITH CHECK ADD FOREIGN KEY([item_code])
REFERENCES [dbo].[Item] ([item_code])
ON UPDATE CASCADE
GO
/****** Object:  ForeignKey [FK__Item_borr__borro__2A4B4B5E]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_borrow]  WITH CHECK ADD  CONSTRAINT [FK__Item_borr__borro__2A4B4B5E] FOREIGN KEY([borrow_ID])
REFERENCES [dbo].[Item_borrow_operation] ([borrow_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_borrow] CHECK CONSTRAINT [FK__Item_borr__borro__2A4B4B5E]
GO
/****** Object:  ForeignKey [FK__Item_borr__item___2B3F6F97]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_borrow]  WITH CHECK ADD  CONSTRAINT [FK__Item_borr__item___2B3F6F97] FOREIGN KEY([item_code])
REFERENCES [dbo].[Item] ([item_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_borrow] CHECK CONSTRAINT [FK__Item_borr__item___2B3F6F97]
GO
/****** Object:  ForeignKey [FK__Item_in_s__item___1ED998B2]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_in_storage]  WITH CHECK ADD  CONSTRAINT [FK__Item_in_s__item___1ED998B2] FOREIGN KEY([item_code])
REFERENCES [dbo].[Item] ([item_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_in_storage] CHECK CONSTRAINT [FK__Item_in_s__item___1ED998B2]
GO
/****** Object:  ForeignKey [FK__Item_in_s__stora__1DE57479]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_in_storage]  WITH CHECK ADD  CONSTRAINT [FK__Item_in_s__stora__1DE57479] FOREIGN KEY([storage_ID])
REFERENCES [dbo].[Item_in_operation] ([storage_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_in_storage] CHECK CONSTRAINT [FK__Item_in_s__stora__1DE57479]
GO
/****** Object:  ForeignKey [FK__Item_out___item___3F466844]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_out_storage]  WITH CHECK ADD FOREIGN KEY([item_code])
REFERENCES [dbo].[Item] ([item_code])
ON UPDATE CASCADE
GO
/****** Object:  ForeignKey [FK__Item_out___out_I__3E52440B]    Script Date: 12/06/2016 19:32:59 ******/
ALTER TABLE [dbo].[Item_out_storage]  WITH CHECK ADD  CONSTRAINT [FK__Item_out___out_I__3E52440B] FOREIGN KEY([out_ID])
REFERENCES [dbo].[Item_out_operation] ([out_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item_out_storage] CHECK CONSTRAINT [FK__Item_out___out_I__3E52440B]
GO
