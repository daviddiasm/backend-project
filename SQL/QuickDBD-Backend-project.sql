-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1yPRqz
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [customers] (
    [customer_id] varchar(50)  NOT NULL ,
    [customer_first_name] varchar(50)  NOT NULL ,
    [customer_last_name] varchar(50)  NOT NULL ,
    [customer_age] varchar(3)  NOT NULL ,
    CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED (
        [customer_id] ASC
    )
)

CREATE TABLE [orders] (
    [row_id] varchar(50)  NOT NULL ,
    [order_id] varchar(50)  NOT NULL ,
    [order_date] datetime  NOT NULL ,
    [customer_id] varchar(50)  NOT NULL ,
    [address_id] varchar(50)  NOT NULL ,
    [item_id] varchar(50)  NOT NULL ,
    [item_quantity] int  NOT NULL ,
    CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

CREATE TABLE [address] (
    [address_id] varchar(50)  NOT NULL ,
    [delivery_address] varchar(100)  NOT NULL ,
    [delivery_state] varchar(50)  NOT NULL ,
    [delivery_zip] varchar(20)  NOT NULL ,
    [delivery_country] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED (
        [address_id] ASC
    )
)

CREATE TABLE [items] (
    [item_id] varchar(50)  NOT NULL ,
    [item_name] varchar(50)  NOT NULL ,
    [item_price] float  NOT NULL ,
    [item_category] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED (
        [item_id] ASC
    )
)

CREATE TABLE [components] (
    [component_id] varchar(50)  NOT NULL ,
    [component_name] varchar(100)  NOT NULL ,
    [component_category] varchar(50)  NOT NULL ,
    [component_price] float  NOT NULL ,
    CONSTRAINT [PK_components] PRIMARY KEY CLUSTERED (
        [component_id] ASC
    )
)

CREATE TABLE [item_components] (
    [row_id] varchar(50)  NOT NULL ,
    [item_id] varchar(50)  NOT NULL ,
    [component_inv_id] varchar(50)  NOT NULL ,
    [component_id] varchar(50)  NOT NULL ,
    [component_quantity] numeric ,
    CONSTRAINT [PK_item_components] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

CREATE TABLE [inventory] (
    [inv_id] varchar(50)  NOT NULL ,
    [component_inv_id] varchar(50)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED (
        [inv_id] ASC
    ),
    CONSTRAINT [UK_inventory_component_inv_id] UNIQUE (
        [component_inv_id]
    )
)

CREATE TABLE [staff] (
    [staff_id] varchar(50)  NOT NULL ,
    [staff_first_name] varchar(50)  NOT NULL ,
    [staff_last_name] varchar(50)  NOT NULL ,
    [staff_position] varchar(50)  NOT NULL ,
    [staff_hour_rate] float  NOT NULL ,
    [shift_hours] int  NOT NULL ,
    [monthly_working_days] int  NOT NULL ,
    CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED (
        [staff_id] ASC
    )
)

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_orders_customer_id] FOREIGN KEY([customer_id])
REFERENCES [customers] ([customer_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_customer_id]

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_Orders_address_id] FOREIGN KEY([address_id])
REFERENCES [address] ([address_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_address_id]

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_orders_item_id] FOREIGN KEY([item_id])
REFERENCES [items] ([item_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_item_id]

ALTER TABLE [item_components] WITH CHECK ADD CONSTRAINT [FK_item_components_item_id] FOREIGN KEY([item_id])
REFERENCES [items] ([item_id])

ALTER TABLE [item_components] CHECK CONSTRAINT [FK_Item_Components_item_id]

ALTER TABLE [item_Components] WITH CHECK ADD CONSTRAINT [FK_item_components_component_inv_id] FOREIGN KEY([component_inv_id])
REFERENCES [inventory] ([component_inv_id])

ALTER TABLE [item_components] CHECK CONSTRAINT [FK_item_components_component_inv_id]

ALTER TABLE [item_components] WITH CHECK ADD CONSTRAINT [FK_item_components_component_id] FOREIGN KEY([component_id])
REFERENCES [components] ([component_id])

ALTER TABLE [item_components] CHECK CONSTRAINT [FK_item_components_component_id]

COMMIT TRANSACTION QUICKDBD
