//
//  SupabaseManager.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/26/26.
//

import Foundation
import Supabase

final class SupabaseManager {
    
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: AppConstant.SupabaseClient.supabaseURL)!,
            supabaseKey: AppConstant.SupabaseClient.supabaseKey
        )
    }
}
