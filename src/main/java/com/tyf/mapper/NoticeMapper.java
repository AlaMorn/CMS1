package com.tyf.mapper;

import com.tyf.pojo.MainNotice;

public interface NoticeMapper {
    boolean updateByNoticeSid(MainNotice mainNotice);
    MainNotice selectByMainNoticeSid(String sid);
}
