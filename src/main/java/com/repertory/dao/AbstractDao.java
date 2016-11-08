package com.repertory.dao;

import com.repertory.config.Factory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Finderlo on 2016/11/4.
 */
@Repository
public abstract class AbstractDao<T extends Object> {

    //    @Inject
//    @Autowired
    protected SessionFactory sessionFactory = Factory.sessionFactory();
//    @Autowired
//    protected SessionFactory sessionFactory;

    private List<String> ids = new ArrayList<>();
    private String id;

    public T findById(String parm) {

        if (isMoreId()) {
            throw new UnsupportedOperationException();
        }

        if (parm == null || parm.trim().equals("")) {
            return null;
        }
        HashMap<String, String> idAndValue = new HashMap<>();
        idAndValue.put(getId(), parm);
        return findByIds(idAndValue);
    }

    public T findByIds(Map<String, String> idAndValues) {
        Session session = sessionFactory.openSession();
        String hql = jointHqlByIdsQuery(idAndValues);
        Query query = session.createQuery(hql);
        List<T> tList = query.list();
        session.close();
        if (tList.isEmpty()) {
            return null;
        }
        return tList.get(0);
    }

    public List<T> findAll(){
        Session session = sessionFactory.openSession();
        Query<T> query =session.createQuery("from "+bindClassName(),bindClass());
        List<T> tList = query.list();
        session.close();
        return tList;
    }

    /**
     * 分页获取所有博客
     * @param pageable
     * @return
     */
//    Page<T> findBlogs(Pageable pageable);

    public List<T> query(String[] keys, String[] values) {
        return query(keys, values, true);
    }

    public List<T> query(String[] keys, String[] values, boolean isLikeQuery) {

        if (keys ==null || values==null || keys.length == 0 || values.length == 0){
            return new ArrayList<T>();
        }

        Session session = sessionFactory.openSession();
        String hql = jointLikeQuery(keys, values, isLikeQuery);
        Query<T> tQuery = session.createQuery(hql);
        List<T> result = tQuery.list();
        session.close();
        return result;
    }

    public void save(T t) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(t);
        session.getTransaction().commit();
        session.close();
    }

    public void saveOrUpdate(T t){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.saveOrUpdate(t);
        session.getTransaction().commit();
        session.close();
    }

    public void delete(T t) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(t);
        session.getTransaction().commit();
        session.close();
    }

    public void update(T t) {
        if (t == null) {
            return;
        }
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(t);
        session.getTransaction().commit();
        session.close();
    }

    public Class bindClass() {
        Type sType = getClass().getGenericSuperclass();
        Type[] generics = ((ParameterizedType) sType).getActualTypeArguments();
        Class<T> mTClass = (Class<T>) (generics[0]);
        return mTClass;
    }

    private String jointLikeQuery(String[] keys, String[] values, boolean isLikeQuery) {
//        String hql = " from UsersEntity e where e.usersName like 'xiao%' and e.usersPassword like 'psd%'";
        String head = "from " + bindClassName();

        int length = keys.length <= values.length ? keys.length : values.length;

        StringBuilder hqlbuilder = new StringBuilder();
        boolean isFirst = true;
        for (int i = 0; i < length; i++) {
            if (keys[i] == null || keys[i].trim().equals("") || values[i] == null || values[i].trim().equals("")) {
                continue;
            }
            if (!isFirst) {
                hqlbuilder.append(" and ");
            } else {
                hqlbuilder.append(" e where ");
                isFirst = false;
            }
            hqlbuilder.append("e.");
            hqlbuilder.append(keys[i]);
            if (isLikeQuery) {
                hqlbuilder.append(" like ");
                values[i] = "%" + values[i] + "%";
            } else {
                hqlbuilder.append(" =");
            }
            hqlbuilder.append("'").append(values[i]).append("'");
        }
        return head + hqlbuilder.toString();
    }

    private String jointHqlByIdsQuery(Map<String, String> idAndValues) {

        String hql = " from " + bindClassName() + " e where ";
        StringBuilder hqlbuilder = new StringBuilder();
        boolean isFirst = true;
        for (Map.Entry<String, String> entry : idAndValues.entrySet()) {
            String value = entry.getValue();
            String key = entry.getKey();
            if (!isFirst) {
                hqlbuilder.append(" and");
            } else {
                isFirst = false;
            }
            hqlbuilder.append(" e.").append(key).append("=").append("'").append(value).append("'");
        }
        return hql + hqlbuilder.toString();
    }

    private String bindClassName() {
        return bindClass().getSimpleName();
    }

    private List<String> getIds() {
        if (ids.isEmpty()) {
            findIds();
        }
        return ids;
    }

    private String getId() {
        if (id == null) {
            findIds();
        }
        return id;
    }

    private void findIds() {
        ids.clear();
        Method[] methods = bindClass().getDeclaredMethods();
        for (Method method : methods) {
            if (method.isAnnotationPresent(javax.persistence.Id.class)) {
                String methodName = method.getName();
                String name = methodName.substring(3);
                char[] idchar = name.toCharArray();
                String first = String.valueOf(idchar[0]).toLowerCase();
                String id = first + String.copyValueOf(idchar, 1, idchar.length - 1);
                ids.add(id);
            }
        }
        if (ids.size() == 1) {
            id = ids.get(0);
        }
    }

    private boolean isMoreId() {
        if (getIds().size() > 1) {
            return true;
        } else {
            return false;
        }
    }


}
