package ${packageName};

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;


class ${pagerAdapterClass} extends FragmentPagerAdapter {

    private Fragment[] fragments = new Fragment[]{
            HomeFragment.newInstance(),
            DashboardFragment.newInstance(),
            NotificationFragment.newInstance()
    };

    ${pagerAdapterClass}(FragmentManager fm) {
        super(fm);
    }

    @Override
    public int getCount() {
        return fragments == null ? 0 : fragments.length;
    }

    @Override
    public Fragment getItem(int position) {
        return fragments == null ? null : fragments[position];
    }
}
