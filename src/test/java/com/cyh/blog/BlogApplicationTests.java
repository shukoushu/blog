package com.cyh.blog;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.service.PostService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@RunWith(SpringRunner.class)
@SpringBootTest
public class BlogApplicationTests {

    @Autowired
    PostService postService;

    @Test
    public void contextLoads() {
        Date datename = new Date();
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；
        String formatDate = dFormat.format(datename);

        try {
            String dateString = "2017-12-20 14:02:08";
            Date dateParse = dFormat.parse(dateString);
            System.out.println(dateParse);
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void post(){
        final Pageable Pageable = PageRequest.of(0, 10);
        long id=2410;
        final Page<Post> post = postService.findByTagId(id, Pageable);
        System.out.println(post.getTotalPages());

    }


}
