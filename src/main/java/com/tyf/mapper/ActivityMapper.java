package com.tyf.mapper;

import com.tyf.pojo.Page;
import com.tyf.pojo.activity;
import org.apache.http.impl.cookie.PublicSuffixListParser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ActivityMapper {
    boolean InsertActivity(activity activity);
    List<activity> SelectByAtySid(Page page);
    boolean UpdateReplyByid(activity activity);
    activity selectByid(Integer id);
    Integer CountActivity(@Param("sid") String sid,@Param("reply")String reply);
}
