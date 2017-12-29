package ${packageName};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;


public class ${fragmentClass} extends Fragment {

    private ViewPager mViewPager;

    public static ${fragmentClass} newInstance() {
        return new ${fragmentClass}();
    }

    //Default constructor.
    public ${fragmentClass}() {

    }

    private BottomNavigationView.OnNavigationItemSelectedListener mNavigationListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {
        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
           <#if isLibraryProject!false>
            int id = item.getItemId();
            if (id == R.id.navigation_home) {
                mViewPager.setCurrentItem(0, false);
                return true;
            } else if (id == R.id.navigation_dashboard) {
                mViewPager.setCurrentItem(1, false);
                return true;
            } else if (id == R.id.navigation_notifications) {
                mViewPager.setCurrentItem(2, false);
                return true;
            }
<#else>
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    mViewPager.setCurrentItem(0, false);
                    return true;
                case R.id.navigation_dashboard:
                    mViewPager.setCurrentItem(1, false);
                    return true;
                case R.id.navigation_notifications:
                    mViewPager.setCurrentItem(2, false);
                    return true;
            }
</#if>
            return false;
        }
    };


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View content = inflater.inflate(R.layout.${fragmentLayoutName}, container, false);
        mViewPager = content.findViewById(R.id.viewpager);
        mViewPager.setAdapter(new ${pagerAdapterClass}(getFragmentManager()));
        BottomNavigationView navigationView = content.findViewById(R.id.navigation);
        navigationView.setOnNavigationItemSelectedListener(mNavigationListener);
        return content;
    }
}
