package vendorsBLL;

import java.util.List;

import vendorsModel.Menu;

public class UserManager {
	
	public boolean isAuthorised(List<Menu> lstMenu, String pageName) 
	{		
		for(Menu menu : lstMenu) {			
			if(menu.menuUrl.equals(pageName)  ) 
				return true;				
		}		
		return false;
	}
	
	

}
