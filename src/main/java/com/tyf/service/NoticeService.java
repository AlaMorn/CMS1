package com.tyf.service;

import com.tyf.pojo.MainNotice;
import com.tyf.pojo.notice;

public interface NoticeService {
   public boolean updateByNoticeSid(MainNotice mainNotice);
   public MainNotice selectByMainNoticeSid(String sid);
}
