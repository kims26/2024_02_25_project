package project.projectmini.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.projectmini.vo.PeopleVo;

@Mapper
public interface PeopleDao {


            public List<PeopleVo> selectList();

            public int insertPeople(PeopleVo vo);

            public PeopleVo selectOneFromIdx(int p_idx);

            public PeopleVo selectOneFromId(String p_email);

    
}
