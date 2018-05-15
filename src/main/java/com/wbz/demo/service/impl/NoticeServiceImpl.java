package com.wbz.demo.service.impl;

import com.wbz.demo.entity.Notice;
import com.wbz.demo.entity.custom.NoticeCustom;
import com.wbz.demo.mapper.NoticeMapper;
import com.wbz.demo.mapper.custom.NoticeMapperCustom;
import com.wbz.demo.service.NoticeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapperCustom noticeMapperCustom;

    @Autowired
    private NoticeMapper noticeMapper;


    @Override
    public List<NoticeCustom> listNotice(Integer status) throws Exception {
        List<NoticeCustom> noticeList = noticeMapperCustom.listNotice(status);
        return noticeList;
    }

    @Override
    public void insertNotice(Notice notice) throws Exception {
        noticeMapper.insertSelective(notice);
    }

    @Override
    public void deleteNotice(Integer id) throws Exception {
        noticeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateNotice(Notice notice) throws Exception {
        noticeMapper.updateByPrimaryKeySelective(notice);
    }

    @Override
    public NoticeCustom getNoticeById(Integer id) throws Exception {
        Notice notice = noticeMapper.selectByPrimaryKey(id);
        NoticeCustom noticeCustom = new NoticeCustom();
        BeanUtils.copyProperties(notice,noticeCustom);
        return noticeCustom;
    }
}
