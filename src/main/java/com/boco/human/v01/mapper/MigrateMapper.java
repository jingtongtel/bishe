package com.boco.human.v01.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface MigrateMapper {

	public List<Map> queryStuNum(Map stuSum);

}
