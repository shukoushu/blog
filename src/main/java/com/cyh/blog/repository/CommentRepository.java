package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends  JpaSpecificationExecutor<Comment>, JpaRepository<Comment,Long>{

   Comment findCommentByCommentId(Long id);

   Page<Comment> findCommentsByPost(Post post, Pageable pageable);

   @Query(value = "SELECT * FROM comment ORDER BY comment_date DESC LIMIT 5",nativeQuery = true)
   List<Comment> findTopFive();


   @Query(value = "SELECT * FROM comment WHERE is_read = 1",nativeQuery = true)
   List<Comment> findNoReadNum();

   @Modifying
   @Query(value = "UPDATE comment SET is_read = 0 WHERE is_read = 1",nativeQuery = true)
   void updateUnreadtoHaveRead();
}
