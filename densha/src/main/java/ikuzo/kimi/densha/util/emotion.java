package ikuzo.kimi.densha.util;


import java.io.IOException;
	import java.net.URI;
	import org.apache.http.entity.StringEntity;
	import org.apache.http.HttpResponse;
	import org.apache.http.client.HttpClient;

	import org.apache.http.entity.ContentType;
	import org.apache.http.client.methods.HttpPost;
	import org.apache.http.HttpEntity;
	import org.apache.http.client.utils.URIBuilder;
	import org.apache.http.impl.client.HttpClients;
	import org.apache.http.util.EntityUtils;
	
	public class emotion {
	  public static void main(String[] args) {
	   HttpClient httpclient = HttpClients.createDefault();
	   try
	   {
	      URIBuilder builder = new URIBuilder("https://westus.api.cognitive.microsoft.com/vision/v1.0/analyze");
	      // Specify your subscription key
	      builder.setParameter("subscription-key", "7e3dfc8819a444d8a399818b898a8e9c");
	      // Specify values for optional parameters, as needed
	      builder.setParameter("visualFeatures", "Description");
//	      builder.setParameter("visualFeatures", "Adult");
//	      builder.setParameter("visualFeatures", "ImageType");
//	      builder.setParameter("visualFeatures", "Color");
//	      builder.setParameter("visualFeatures", "Tags ");
	      builder.setParameter("language", "en");
	
	      URI uri = builder.build();
	      
	      HttpPost request = new HttpPost(uri);
	      StringEntity reqEntity = new StringEntity("{'Url': 'http://121.133.120.125:81/229_1869_043.jpg'}", ContentType.create("application/json"));
	      request.setEntity(reqEntity);
	      HttpResponse response = httpclient.execute(request);
	      HttpEntity entity = response.getEntity();
	      if (entity != null) {
	         System.out.println(EntityUtils.toString(entity));
	      }
	   }
	   catch (Exception e)
	   {
	      System.out.println(e.getMessage());
	   }
	  }
	}