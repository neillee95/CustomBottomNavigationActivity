package ${packageName}

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

class NotificationFragment : Fragment() {

    private var isViewCreated: Boolean = false
    private var isDataLoaded: Boolean = false

    override fun setUserVisibleHint(isVisibleToUser: Boolean) {
        super.setUserVisibleHint(isVisibleToUser)
        if (isVisibleToUser && isViewCreated && !isDataLoaded) {
            lazyLoad()
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        isViewCreated = true
        return super.onCreateView(inflater, container, savedInstanceState)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        if (userVisibleHint && !isDataLoaded) {
            lazyLoad()
        }
    }

    protected fun lazyLoad() {
        isDataLoaded = true
    }

    companion object {

        fun newInstance(): NotificationFragment {
            return NotificationFragment()
        }
    }
}
