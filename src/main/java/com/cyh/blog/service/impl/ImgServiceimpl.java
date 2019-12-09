package com.cyh.blog.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import com.cyh.blog.model.domain.Img;
import com.cyh.blog.repository.ImgRepository;
import com.cyh.blog.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ImgServiceimpl implements ImgService {

    @Autowired
    ImgRepository imgRepository;
    @Override
    public Page<Img> findimg(Pageable pageable){
        return imgRepository.findAll(pageable);
    }

    @Override
    public Map<String, String> imgupload(MultipartFile file) {
        Map<String,String> map = new HashMap<String, String>();
        try {
            /*String dateString = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss");*/
            final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
            uploadPath.append("/.blog/");
            uploadPath.append("upload/");
            uploadPath.append(DateUtil.thisYear()).append("/").append(DateUtil.thisMonth()+1).append("/");
            File mediaPath = new File(uploadPath.toString());
            if (!mediaPath.exists()) {
                mediaPath.mkdirs();
                }
            String fileName=file.getOriginalFilename();

            file.transferTo(new File(mediaPath.getAbsoluteFile(),fileName));
            final String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
            final StrBuilder filePath = new StrBuilder("/upload/");
            filePath.append(DateUtil.thisYear());
            filePath.append("/");
            filePath.append(DateUtil.thisMonth()+1);
            filePath.append("/");
            filePath.append(fileName);
            map.put("filename",fileName);
            map.put("filesuffix",fileSuffix);
            map.put("filepath",filePath.toString());

        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    public void save(Img img){
        imgRepository.save(img);
    }

    @Override
    public List<Img> findAll() {
        return imgRepository.findAll();
    }

    @Override
    public Img findingbyid(Long id) {
        final Optional<Img> img = imgRepository.findById(id);
        return  img.get();
    }

    @Override
    public void imgRemove(Long id) {
        final Optional<Img> img = imgRepository.findById(id);
        String imgName = img.get().getImgName();
        String userPath = System.getProperties().getProperty("user.home")+"/.blog";
        int i = img.get().getImgPath().lastIndexOf("/");
        File mediaPath= new File(userPath,img.get().getImgPath().substring(0,img.get().getImgPath().lastIndexOf("/")));
        File delFile = new File(new StringBuffer(mediaPath.getAbsolutePath()).append("/").append(imgName).toString());
        if(delFile.exists()&&delFile.isFile()){
            imgRepository.deleteById(id);;
            delFile.delete();
        }



    }

    @Override
    public Long imgCount() {
        return imgRepository.count();
    }

}


