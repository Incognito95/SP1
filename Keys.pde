class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean UPDown = false;
  private boolean DOWNDown = false;
  private boolean RIGHTDown = false;
  private boolean LEFTDown = false;
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
  
  public boolean UPDown()
  {
    return UPDown;
  }
  
  public boolean DOWNDown()
  {
    return DOWNDown;
  }
  
  public boolean RIGHTDown()
  {
    return RIGHTDown;
  }
  
  public boolean LEFTDown()
  {
    return LEFTDown;
  }
  
  
  
  void onKeyPressed(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
  }
  
  void onKeyReleased(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
  }
  
  void onKeyPressed1()
  {
    if(keyCode ==DOWN)
    {
      DOWNDown = true;
    }
    else if (keyCode ==UP)
    {
      UPDown = true;
    }
    else if(keyCode ==RIGHT)
    {
      RIGHTDown = true;
    }
    else if(keyCode ==LEFT)
    {
      LEFTDown = true;
    }
  }
  
  void onKeyReleased1()
  {
    if(keyCode ==DOWN)
    {
      DOWNDown = false;
    }
    else if (keyCode ==UP)
    {
      UPDown = false;
    }
    else if(keyCode ==RIGHT)
    {
      RIGHTDown = false;
    }
    else if(keyCode ==LEFT)
    {
      LEFTDown = false;
    }
  }
}
