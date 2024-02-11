package base.service;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

public interface BaseService<ID extends Serializable, Entity extends Serializable> {
    void save(Entity entity);

    void update(Entity entity);

    void remove(Entity entity);

    Optional<Entity> findById(ID id);

    List<Entity> findAll();
}
