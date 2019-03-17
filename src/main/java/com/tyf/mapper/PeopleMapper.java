package com.tyf.mapper;

import com.tyf.pojo.Page;
import com.tyf.pojo.people;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PeopleMapper {
    List<people> selectBypeopleSid(@Param("sid") String sid);
    List<people> SelectByPeople(Page page);
    boolean insertBypeopleSid(people people);
    boolean deleteBypeopleId(Integer id);
    List<String> selectSid(@Param("str") String str);
    Integer countSid(String sid);
    Integer CountPeople(@Param("sid") String sid,@Param("name")String name);
}
