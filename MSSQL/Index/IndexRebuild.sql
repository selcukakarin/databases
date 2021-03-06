USE [SampleData]
GO
ALTER INDEX [IX1] ON [dbo].[CUSTOMERS] 
REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

-- SORT_IN_TEMPDB : Eğer tempdb başka bir diskte ise indexi rebuild ederken bizim asıl kaynağımız olan diski kullanmak yerine tempdbyi bulunduran diski kullanır.
-- ONLINE : sistem çalışırken rebuild yapmayı sağlar ama offline'a göre daha uzun süre alır.