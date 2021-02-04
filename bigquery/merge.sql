-- merge sistemi sadece target tablo üzerinde işlem yapmayı sağlıyor, source tablo üzerinde işlem yaptırmıyor.
merge `dsmbootcamp.selcuk_akarin.order_price` t    -- merge kısmına tablo vermek zorundayız.
using `dsmbootcamp.selcuk_akarin.order_price_temp`s    -- using'de kullanılan element sadece tablo olmak zorunda değil select de olabilir. yalnız on statement'ındaki alan unique olmalı.
on t.order_id = s.order_id
when matched then
  update set t.total_coupon = s.total_coupon + t.total_coupon
when not matched by source and invoice_amount > 20 and invoice_amount < 100 then    -- eger source'ta yoksa -- kayıt id bazında eşleşmiyor ama kayıt source'ta yok targetta varsa
  update set t.total = total * 100
when not matched by source and invoice_amount > 100 then    -- kayıt id bazında eşleşmiyor ve eger source'ta yok targetta var ise
  delete
when not matched by target and invoice_amount >100 then   -- kayıt id bazında eşleşmiyor ve source'da var targetta yoksa target'a insert et kaydı.
  insert (order_id,total_coupon,total_promotion,invoice_amount,total_packaging,total_product,total_base,