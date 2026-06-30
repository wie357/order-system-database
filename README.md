# 點餐與預約管理系統

這是一個可部署到 Vercel 的靜態網站，包含：

- 點餐品項、單價、份數與總金額計算
- 優惠折扣與扣除金額
- 餐點備品統計
- 預約登記、預約時段與月曆
- 登記團體、窗口、手機
- Supabase 後台資料庫設定

## 部署

將此資料夾連接到 GitHub repository，再於 Vercel 匯入該 repository。之後每次更新 GitHub，Vercel 會自動重新部署。

## 資料庫

若要啟用跨裝置資料同步，請到 Supabase SQL Editor 執行 `supabase-schema.sql`，再將 Supabase Project URL 與 anon public key 填入網站的「資料庫」分頁。
