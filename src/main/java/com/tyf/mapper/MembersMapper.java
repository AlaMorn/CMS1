package com.tyf.mapper;


import com.tyf.pojo.Page;
import com.tyf.pojo.members;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MembersMapper {
    members selectById(String id);
    members selectBySid(String sid);
    List<members> AllSelect(Page page);
    Integer CountMembers();
    boolean UpdataImage(@Param("img") String img,@Param("sid")String sid);
}
