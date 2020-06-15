package com.framework.service.base;

import com.framework.entity.AjaxPaging;
import com.framework.entity.Paging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by fy on 2016/9/14.
 * <p>
 * 只需要继承一下，即可免去N多不必要代码
 *
 * @param <T> 泛型：请填写返回数据的entity类型
 */
public class BaseService<T> {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

    /**
     * 获取《泛型》对应的Mapper类型全名
     *
     * @return
     */
    private String getMapperName() {
        ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
        Class<T> entityClass = (Class<T>) (parameterizedType.getActualTypeArguments()[0]);
        String entityName = entityClass.getName();
        return entityName.replace("entity", "dao") + "Mapper";
    }

    private String statement(String methodName) {
        return this.getMapperName() + "." + methodName;
    }

    @Transactional(readOnly = true)
    public List<T> searchListPage(Paging<T> paging, T param) throws Exception {
        paging.setPd(param);
        return sqlSessionTemplate.selectList(statement("searchListPage"), paging);
    }

    @Transactional(readOnly = true)
    public List<T> ajaxSearchListPage(AjaxPaging<T> ajaxPaging, T param) throws Exception {
        ajaxPaging.setPd(param);
        return sqlSessionTemplate.selectList(statement("ajaxSearchListPage"), ajaxPaging);
    }

    @Transactional
    public int delete(Integer id) {
        return sqlSessionTemplate.delete(statement("deleteByPrimaryKey"), id);
    }

    @Transactional
    public int insert(T record) {
        return sqlSessionTemplate.insert(statement("insert"), record);
    }

    @Transactional
    public int insertSelective(T record) {
        return sqlSessionTemplate.insert(statement("insert"), record);
    }

    @Transactional(readOnly = true)
    public T selectOne(Integer id) {
        return sqlSessionTemplate.selectOne(statement("selectByPrimaryKey"), id);
    }

    @Transactional
    public int updateSelective(T record) {
        return sqlSessionTemplate.update(statement("updateByPrimaryKeySelective"), record);
    }

    @Transactional
    public int updateWithBLOBs(T record) {
        return sqlSessionTemplate.update(statement("updateByPrimaryKeyWithBLOBs"), record);
    }

    @Transactional
    public int update(T record) {
        return sqlSessionTemplate.update(statement("updateByPrimaryKey"), record);
    }

}
