package repository.impl;

import base.repository.impl.BaseRepositoryImpl;
import entity.Vote;
import jakarta.persistence.EntityManager;
import repository.VoteRepository;

public class VoteRepositoryImpl extends BaseRepositoryImpl<Long, Vote> implements VoteRepository {
    public VoteRepositoryImpl(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Class<Vote> getEntityClass() {
        return Vote.class;
    }
}
