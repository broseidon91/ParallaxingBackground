class BlockSort implements Comparator<Block>
{
  @Override
  public int compare(Block b1, Block b2)
  {
    return (int)b1.z - (int)b2.z;
  }
  
}
