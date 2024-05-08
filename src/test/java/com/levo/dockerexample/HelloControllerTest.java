import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;
import java.util.Date;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.levo.dockerexample.controller.HelloController;

public class HelloControllerTest {

    private MockMvc mockMvc;

    @InjectMocks
    private HelloController helloController;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(helloController).build();
    }

    @Test
    public void testHelloEndpoint() throws Exception {
        MvcResult result = mockMvc.perform(get("/docker-java-app/test"))
                                  .andExpect(status().isOk())
                                  .andReturn();
        String content = result.getResponse().getContentAsString();
        assertEquals("docker-java-app is up and running: " + new Date(), content);
    }
}
