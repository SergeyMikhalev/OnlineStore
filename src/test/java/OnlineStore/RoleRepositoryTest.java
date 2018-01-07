package OnlineStore;

import OnlineStore.repositories.RoleRepository;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class RoleRepositoryTest extends TestSuperClass {

    @Autowired
    RoleRepository roleRepository;

    @Test
    public void testReadFromDB()
    {
        Assert.assertNotNull(roleRepository.findAll());
    }

}
