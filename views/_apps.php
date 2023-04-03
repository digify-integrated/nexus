<?php
    $app_content = '';

    $all_accessible_module_details = $api->get_all_accessible_module_details($username);
    $module_count = count($all_accessible_module_details);

    for ($i = 0; $i < $module_count; $i++) {
        $module = $all_accessible_module_details[$i];
        $module_name = $module['MODULE_NAME'];
        $module_description = $module['MODULE_DESCRIPTION'];
        $module_version = $module['MODULE_VERSION'];
        $module_category = $module['MODULE_CATEGORY'];
        $module_icon = $module['MODULE_ICON'];
        $default_page = $module['DEFAULT_PAGE'];
        $module_icon_file_path = $api->check_image($module_icon, 'module icon');
        $module_category_name = $api->get_system_code_details(null, 'MODULECAT', $module_category)[0]['SYSTEM_DESCRIPTION'] ?? null;
    
        if ($i % 4 == 0) {
            $app_content .= '<div class="row">';
        }
    
        $app_content .= '<div class="col-xl-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="favorite-icon">
                                        <a href="'. $default_page .'"><i class="uil uil-heart-alt fs-18"></i></a>
                                    </div>
                                    <img src="'. $module_icon_file_path .'" alt="" height="50" class="mb-3">
                                    <h5 class="fs-17 mb-2"><a href="'. $default_page .'" class="text-dark">'. $module_name .'</a> <small class="text-muted fw-normal">('. $module_version .')</small></h5>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item">
                                            <p class="text-muted fs-14 mb-1">'. $module_description .'</p>
                                        </li>
                                    </ul>
                                    <div class="mt-3 hstack gap-2">
                                        <span class="badge rounded-1 badge-soft-success">'. $module_category_name .'</span>
                                    </div>
                                    <div class="mt-4 hstack gap-2">
                                        <a href="'. $default_page .'" class="btn btn-info w-100">View App</a>
                                    </div>
                                </div>
                            </div>
                        </div>';
    
        if ($i % 4 == 3 || $i === $module_count - 1) {
            $app_content .= '</div>';
        }
    }

    echo $app_content;
?>