(use-package calendar
    :config
    (setq cal-html-directory MY-GTD-PATH)   ;设置导出calendar的为html时的默认存放目录
    ;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
    (setq calendar-longitude +113.31)
    (setq calendar-latitude +22.39)
    (setq calendar-location-name "东莞")
    ;; 设置阴历显示，在 calendar 上用 pC 显示阴历
    (setq chinese-calendar-celestial-stem
          ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
    (setq chinese-calendar-terrestrial-branch
          ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
    ;; 设置 calendar 的显示
    (setq calendar-remove-frame-by-deleting t)
    (setq calendar-week-start-day 1)            
                                        ; 设置星期一为每周的第一天
    (setq mark-diary-entries-in-calendar t)     
                                        ; 标记calendar上有diary的日期
    (setq mark-holidays-in-calendar nil)        
                                        ; 为了突出有diary的日期，calendar上不标记节日
    (setq view-calendar-holidays-initially nil) 
                                        ; 打开calendar的时候不显示一堆节日 
    ;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
    (setq christian-holidays nil)
    (setq hebrew-holidays nil)
    (setq islamic-holidays nil)
    (setq solar-holidays nil)
    (setq general-holidays '((holiday-fixed 1 1 "元旦")
                             (holiday-fixed 2 10 "我的生日")
                             (holiday-fixed 2 14 "情人节")
                             (holiday-fixed 3 14 "白色情人节")
                             (holiday-fixed 4 1 "愚人节")
                             (holiday-fixed 5 1 "劳动节")
                             (holiday-float 5 0 2 "母亲节")
                             (holiday-fixed 6 1 "儿童节")
                             (holiday-float 6 0 3 "父亲节")
                             (holiday-fixed 7 1 "建党节")
                             (holiday-fixed 8 1 "建军节")
                             (holiday-fixed 9 10 "教师节")
                             (holiday-fixed 9 23 "她的生日")
                             (holiday-fixed 10 1 "国庆节")
                             (holiday-fixed 12 25 "圣诞节"))))

(use-package diary
  :config
  ;;在mode-line显示时间
  (setq display-time-24hr-format t)
  (setq display-time-day-and-date t)
  (display-time-mode 1)
  (setq todo-file-do (concat MY-GTD-PATH "todo/do"))
  (setq todo-file-done (concat MY-GTD-PATH "todo/done"))
  (setq todo-file-top (concat MY-GTD-PATH "todo/top"))
  (setq diary-file (concat MY-GTD-PATH "diary"))
  (setq diary-mail-addr "lujun9972@sina.com")
  (add-hook 'diary-hook 'appt-make-list)
  (setq calendar-date-style 'iso)         ;设置diary中的date格式
  )

(use-package appt
  :config
  (appt-activate 1)                       ;开启提醒appointment功能
  (setq appt-audible t)                   ;开启appointment的声音提醒
  (setq appt-display-mode-line t)         ;在mode-line上显示appointment的倒计时
  (add-hook 'diary-hook 'appt-make-list)
  (setq appt-issue-message t))

(level-require "init-GTD-org")
;(org-babel-load-file "init-GTD-bbdb.org")