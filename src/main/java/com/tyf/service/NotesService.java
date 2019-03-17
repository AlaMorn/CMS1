package com.tyf.service;

import com.tyf.pojo.notes;

import java.util.List;

public interface NotesService {
    public List<notes> selectByNoteSid(String sid);
    public boolean insertByNoteSid(notes notes);
}
