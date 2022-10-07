From b65e860db6600472ec70f40a6d42e81c2cd1d0bb Mon Sep 17 00:00:00 2001
From: ChonDoit <thphantomblog@gmail.com>
Date: Fri, 7 Oct 2022 21:01:28 +0000
Subject: [PATCH] generate.sh: Remove GApps call from bg* builds

---
 generate.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/generate.sh b/generate.sh
index 7afe4e2..c363280 100644
--- a/generate.sh
+++ b/generate.sh
@@ -26,7 +26,6 @@ for part in a ab;do
 		optional_base=""
 				if [ "$apps" == "gapps" ];then
 					apps_suffix="g"
-					apps_script='$(call inherit-product, device/phh/treble/gapps.mk)'
 					apps_name="with GApps"
 				fi
 				if [ "$apps" == "gapps-go" ];then
-- 
2.34.1

