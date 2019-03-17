package com.tyf.service.Impl;

import com.tyf.mapper.NoticeMapper;
import com.tyf.pojo.MainNotice;
import com.tyf.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;
    @Override
    public boolean updateByNoticeSid(MainNotice mainNotice) {
        return noticeMapper.updateByNoticeSid(mainNotice);
    }

    @Override
    public MainNotice selectByMainNoticeSid(String sid) {
        return noticeMapper.selectByMainNoticeSid(sid);
    }
}
