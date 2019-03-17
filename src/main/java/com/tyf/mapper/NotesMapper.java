package com.tyf.mapper;

import com.tyf.pojo.notes;

import java.util.List;

public interface NotesMapper {
    List<notes> selectByNoteSid(String sid);
    boolean insertByNoteSid(notes notes);
}
