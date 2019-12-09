package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface PostRepository extends JpaRepository<Post,Long>, JpaSpecificationExecutor<Post> {


    @Query(value = "SELECT YEAR(post_date) AS YEAR,MONTH(post_date) AS MONTH,COUNT(*) AS COUNT FROM blog_post GROUP BY YEAR(post_date),MONTH(post_date) ORDER BY YEAR DESC,MONTH DESC", nativeQuery = true)
    List<Object[]> findPostGroupByYearAndMonth();

    @Query(value = "select *,year(post_date) as year,month(post_date) as month from blog_post where  year(post_date)=:year and month(post_date)=:month order by post_date desc",nativeQuery = true)
    List<Post> findPostByYearAndMonth(@Param("year") String year, @Param("month") String month);

    @Query(value = "SELECT * FROM blog_post ORDER BY post_date DESC LIMIT 5", nativeQuery = true)
    List<Post> findTopFive();

    Post findPostByPostUrl(String url);

    Page<Post> findAllByPostDateAfter(Date postDate, Pageable pageable);

    Page<Post> findAllByPostDateBefore(Date postDate, Pageable pageable);

    @Query(value = "SELECT * FROM blog_post JOIN posts_tags ON blog_post.post_id=posts_tags.post_id WHERE tag_id =:tagId", nativeQuery = true)
    Page<Post> findAllByTagId(@Param("tagId") Long tagId,Pageable pageable);

    Page<Post> findByPostTitleLikeOrPostContentLike(String keyword,String keyword2,Pageable pageable);



}
