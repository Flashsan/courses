package by.it.academy.repository.dao.impl;

import by.it.academy.repository.dao.MentorDao;
import by.it.academy.repository.dao.exception.EntityDaoException;
import by.it.academy.repository.entity.Mentor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.persistence.EntityManager;

public class MentorDaoImpl extends EntityDaoImpl<Mentor> implements MentorDao {
    /**
     *
     */
    private static final Logger LOGGER = LogManager.getLogger(MentorDaoImpl.class);

    public MentorDaoImpl(EntityManager em) {
        super(em, Mentor.class);
    }

    @Override
    public void delete(Integer id) {
        try {
            Mentor mentor = findById(id);
            LOGGER.trace(getClass().getSimpleName() + " deleting " + mentor);
            if(mentor != null) {
                mentor.getCourses().forEach(course -> {
                    course.setMentorField(null);
                    entityManager.getTransaction().begin();
                    entityManager.merge(course);
                    entityManager.getTransaction().commit();
                });
                entityManager.getTransaction().begin();
                entityManager.remove(mentor);
                entityManager.getTransaction().commit();
            }

        } catch (RuntimeException e) {
            entityManager.getTransaction().rollback();
            throw new EntityDaoException(e);
        }
    }
}
