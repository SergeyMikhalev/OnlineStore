package OnlineStore;

import OnlineStore.OnlineStoreApplication;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(classes = {OnlineStoreApplication.class})
//@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {OnlineStoreApplication.class})
public class TestSuperClass {

    @Test
    public void testTest()
    {
        Assert.assertTrue(true);
    }

}
