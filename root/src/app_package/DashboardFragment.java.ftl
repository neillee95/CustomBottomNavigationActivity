package ${packageName};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


public class DashboardFragment extends Fragment {

    private boolean isViewCreated;
    private boolean isDataLoaded;

    public static DashboardFragment newInstance() {
        return new DashboardFragment();
    }

    //Default constructor.
    public DashboardFragment() {

    }

    @Override
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (isVisibleToUser && isViewCreated && !isDataLoaded) {
            lazyLoad();
        }
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        isViewCreated = true;
        return super.onCreateView(inflater, container, savedInstanceState);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (getUserVisibleHint() && !isDataLoaded) {
            lazyLoad();
        }
    }

    protected void lazyLoad() {
        isDataLoaded = true;
    }
}
