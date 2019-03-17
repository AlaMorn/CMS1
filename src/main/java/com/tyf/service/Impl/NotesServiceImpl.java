package com.tyf.service.Impl;

import com.tyf.mapper.NotesMapper;
import com.tyf.pojo.notes;
import com.tyf.service.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("NotesService")
public class NotesServiceImpl implements NotesService {
    @Autowired
    private NotesMapper notesMapper;
    @Override
    public List<notes> selectByNoteSid(String sid) {
        return notesMapper.selectByNoteSid(sid);
    }

    @Override
    public boolean insertByNoteSid(notes notes) {
        return notesMapper.insertByNoteSid(notes);
    }
}
