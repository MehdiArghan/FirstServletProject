package service.impl;

import base.service.impl.BaseServiceImpl;
import entity.Vote;
import jakarta.persistence.EntityManager;
import repository.VoteRepository;
import service.VoteService;

public class VoteServiceImpl extends BaseServiceImpl<Long, Vote, VoteRepository> implements VoteService {
    public VoteServiceImpl(EntityManager entityManager, VoteRepository repository) {
        super(entityManager, repository);
    }
}
