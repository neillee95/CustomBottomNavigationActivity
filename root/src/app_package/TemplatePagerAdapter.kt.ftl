package ${packageName}

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentPagerAdapter

 class ${pagerAdapterClass}(fm: FragmentManager) : FragmentPagerAdapter(fm) {

    private val fragments = arrayOf(
            HomeFragment.newInstance(),
            DashboardFragment.newInstance(),
            NotificationFragment.newInstance()
    )

    override fun getCount(): Int {
        return fragments.size
    }

    override fun getItem(position: Int): Fragment? {
        return fragments[position]
    }
}
