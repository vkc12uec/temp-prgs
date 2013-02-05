#include "../inc/ConstHash.h"
#include <time.h>

CItem::CItem()
{
  m_nHashValue = (unsigned int)((unsigned int)this + time(NULL));
}

CBucket::CBucket()
{
  m_nHashValue = (unsigned int)((unsigned int)this + time(NULL));
}

CConstHash::CConstHash(unsigned short nBucketReplica):m_nBucketReplica(nBucketReplica)
{ }

bool CConstHash::AddBucket(CBucket *pBucket)
{
  if (pBucket != NULL)
  {
    unsigned int nHash = pBucket->GetHashCode();
    for (unsigned short i = 1; i <= m_nBucketReplica; ++i)
    {
      unsigned long long ullHash  = (unsigned long long)(nHash * RAND_MUL_FACTOR * i);
      unsigned short uHash = ullHash % (1 << (sizeof(unsigned short) * 8));
      if (m_mapBucketPointTree.count(uHash) != 0)
      {
        printf("INFO - Bucket Hash Colision! [%hu]-th of total [%hu] replica not added.\n", i, m_nBucketReplica);
      }
      else
      {
        m_mapBucketPointTree[uHash] = pBucket;
      }
    }

    return true;
  }
  else
  {
    return true;
  }
}

bool CConstHash::RemoveBucket(CBucket *pBucket)
{
  if (pBucket != NULL)
  {
    unsigned int nHash = pBucket->GetHashCode();
    for (unsigned short i = 1; i <= m_nBucketReplica; ++i)
    {
      unsigned long long ullHash  = (unsigned long long)(nHash * RAND_MUL_FACTOR * i);
      unsigned short uHash = ullHash % (1 << (sizeof(unsigned short) * 8));
      if (m_mapBucketPointTree.count(uHash) != 0)
      {
        if (m_mapBucketPointTree[uHash] == pBucket)
        {
          m_mapBucketPointTree.erase(uHash);
        }
        else
        {
          printf("INFO - bucket hash colision when removing bucket.\n");
        }
      }
      else
      {
        printf("INFO - the bucket is not currently associated in this hash functioin.\n");
      }
    }

    return true;
  }
  else
  {
    return true;
  }
}

CBucket * CConstHash::MapItemToBucket(CItem *pItem)
{
  if (pItem != NULL)
  {
    unsigned int   nHash = pItem->GetHashCode();
    unsigned short uHash = nHash % (1 << (sizeof(unsigned short) * 8));
    CBucket * pRet = NULL;

    if (m_mapBucketPointTree.count(uHash) != 0)
    {
      pRet = m_mapBucketPointTree[uHash];
    }
    else
    {
      std::map<unsigned short, CBucket *>::const_iterator iter = m_mapBucketPointTree.upper_bound(uHash);
      if (iter == m_mapBucketPointTree.end())
      {
        pRet = m_mapBucketPointTree.begin()->second;
      }
      else
      {
        pRet = iter->second;
      }
    }

    return pRet;
  }

  return NULL;
}

