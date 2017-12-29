package ${packageName}

import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.v4.app.Fragment
import android.support.v4.view.ViewPager
import android.view.LayoutInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup

class ${fragmentClass} : Fragment() {

    private var mViewPager: ViewPager? = null
    private val mNavigationListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.navigation_home -> {
                mViewPager!!.setCurrentItem(0, false)
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_dashboard -> {
                mViewPager!!.setCurrentItem(1, false)
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_notifications -> {
                mViewPager!!.setCurrentItem(2, false)
                return@OnNavigationItemSelectedListener true
            }
        }
        false
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val content = inflater.inflate(R.layout.${fragmentLayoutName}, container, false)
        mViewPager = content.findViewById(R.id.viewpager)
        mViewPager!!.adapter = ${pagerAdapterClass}(fragmentManager)
        val navigationView = content.findViewById<BottomNavigationView>(R.id.navigation)
        navigationView.setOnNavigationItemSelectedListener(mNavigationListener)
        return content
    }

    companion object {

        fun newInstance(): ${fragmentClass} {
            return ${fragmentClass}()
        }
    }
}
