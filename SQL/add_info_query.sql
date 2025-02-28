BULK INSERT Address
FROM 'C:\Users\david\Desktop\address.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Orders
FROM 'C:\Users\david\Desktop\orders.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Staff
FROM 'C:\Users\david\Desktop\staff.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Items
FROM 'C:\Users\david\Desktop\items.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Components
FROM 'C:\Users\david\Desktop\components.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Item_Components
FROM 'C:\Users\david\Desktop\item_components.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Inventory
FROM 'C:\Users\david\Desktop\inventory.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT Customers
FROM 'C:\Users\david\Desktop\customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
